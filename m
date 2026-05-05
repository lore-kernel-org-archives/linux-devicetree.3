Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE7388377;
	Tue,  5 May 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004325; cv=none; b=Bgmd9urN8SQhthc/TXvwDUAWRO+RZRhlaDJZyn6QEeNXc1nQzXLz3e0Rr6/ZaMvgl5mIuNxs/eu6vheAFjlBdex6mkrwnhmJl3NFQUcY/bqS5ZJPUjgcL2Qoz1aS2WGajBn8zmbRVY0ESRhW7dSQIwZ63yQZBo8cgZ7GmujiUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004325; c=relaxed/simple;
	bh=ZNLo7th8W2xt99tj+o8D68RlN3XT//3Th7ovV3uYYg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+/cf90TPZq+z9VeFKKcyomtIXis4/2awc/aig4HHwXNZIpAztBT3G5lXkm5rnZYSnZ3AcUVZZ5QjFZcZTGL6sL44atFplF6GiV4KnsWBTm1ORLvuc2ga2I/LVdcGB/oxy3WyI1sATdQpyaDUEumo2jxum6iKephzy8ArkJw0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjsL/zG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjsL/zG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BAEC2BCB4;
	Tue,  5 May 2026 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778004325;
	bh=ZNLo7th8W2xt99tj+o8D68RlN3XT//3Th7ovV3uYYg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjsL/zG6lQHzWjxl7VvlKMECR6/plMrDl+BOWk4P0sShWXwn7iujy1bYHaZ/vosSf
	 YNxSFDmYXAB6Cziomh6HOAab5uBNCRLE2lo+YbFCfRTfTx9XaafVyyXLkHbg5wY7QT
	 8uRGW85oJ8ZVk96S55Aj9PYG/k5nZAdR5shrSqR/Tj3gH1gV/hgQzTQJBFe2mr+SxX
	 LvsJ4r86z/0FPIgiqN3eLe3Ln/FcFpdbMFCV4O05+S3Sq3N1OBHpAEZYAab5vpTZHN
	 S1Ue40qIv0hycNotuj4mNOCEi6BWehORJ59O4hM55ze+Zh2Ay09hQCxnBDAuzaxxpF
	 4RdW62qlSLXIw==
Date: Tue, 5 May 2026 13:05:22 -0500
From: Rob Herring <robh@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drivers/of: validate live-tree string properties
 before string use
Message-ID: <20260505180522.GA3265505-robh@kernel.org>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
 <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>

On Fri, Apr 17, 2026 at 08:36:00PM +0800, Pengpeng Hou wrote:
> `populate_properties()` stores live-tree property values as raw byte
> sequences plus a separate `length`. They are not globally guaranteed to
> be NUL-terminated.
> 
> `of_prop_next_string()` iterates string-list properties by walking raw
> bytes, `__of_node_is_type()` checks `device_type`,
> `__of_device_is_status()` checks `status`, and
> `of_alias_from_compatible()` reads the first `compatible` entry. These
> paths must validate that the relevant string fits within the property
> bounds before they hand it to C string helpers.
> 
> Validate these live-tree string properties within their declared bounds.
> In particular, make `of_prop_next_string()` reject malformed entries
> before returning them, use `of_property_match_string()` for
> `device_type`, and add unit coverage for malformed first and trailing
> string-list entries.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1:
> - use of_property_match_string() for device_type as suggested by
>   Rob Herring
> - rework of_prop_next_string() so the first returned string is validated
>   through the same bounded path
> - add of_unittest_property_string() coverage for malformed first and
>   trailing string-list entries

Did you even test this? The virt machine under QEMU doesn't even boot. 

[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT                                                                                                                                    

It hangs here.

[    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]                                                                                                                                      
