Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F42F8E93;
	Mon, 29 Jun 2026 04:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707033; cv=none; b=STA4MLp1m55JqV82WT6kHEpplpGQIKAijUkVTr3HxoJoH9U2GOw4pXmF/UOogsW0rua/45i3ApWHfBFJ89auqafT7y+fZOAdgpf3dYoReOeGFNsassGVl0WAnn2EbG7jjygC6ATSbhBVSeTNPZGC7KKV3se3263N2vUeacKVdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707033; c=relaxed/simple;
	bh=2v8U6YY2IfvuIrRd6d3Ish8RxCNCO8hgI2WlB/ukcAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBlJgLzxRNAAqPCv12yN3kKGe8WAw/tIA/4JygU9eO0V0RqWccua2b0s39BjR54MOZvfe0quKNh+qAn6RXQ0nlqLnOqUdGdJ6GS3eSlYnuvWYeNvUlQBRj9naZu7krVftxUW8qK3kddKUEipa0TozKkNP24bXwN3ntYbZmHGqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cdgD8Aml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cdgD8Aml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAB11F000E9;
	Mon, 29 Jun 2026 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782707031;
	bh=GMSEo47JNrqpAkPqEL+EygxS63QZdMKPNqyBWVmnlBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdgD8AmlegczizJj7HovfqCr7SrqOL+w/drR6Tl5guPoMQYY3u5GR4gLyeG0nJ4tv
	 EVyCqKa6WK0q2CNJOP3b3TZ7+0iRKNbI/XT/8Jp+Z0RhEnEHzti04M/pkR2DFYGQ6+
	 ByMAjCB59wvpDwOTUJanulyVggfWVeh2S6aEOR0c=
Date: Mon, 29 Jun 2026 06:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
	mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
	suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
Message-ID: <2026062959-distaste-launder-e253@gregkh>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
> Hi Greg & Alexander,
> 
> Apologies for interrupting again.
> 
> As the TGU hardware plays an important role in Qualcomm tracing design, I
> would greatly appreciate it if you could kindly take some time to review
> this at your earliest convenience.

The merge window _just_ closed, please give us a chance to catch up.

Also, why us?  Surely you have other reviewers for this code, right?

thanks,

greg k-h
