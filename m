Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC1A38A734
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410563; cv=none; b=PDkZxDvp6XrjxxRWEVMt1hrbOapwUFnteCY5Oa4kMdud1jkPrFNvJsLA5Fiaj25N34Ar6rv7PJC2e13VVTT6LVDDnExX84MTNyk8WX2948Q8uPDAgbIBp6Rwyw10wk72UkE15TE+7OB6/ogFqn2dE5qVldbpVIjqGQ3OuxvWKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410563; c=relaxed/simple;
	bh=oiUF5LhxlHtYbTxjopkGNneVmugHN51Eq7CGGnZam7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwRd5lUH0hWck7+luQcwyd8c9yTvq/HzX3XmsPSwRU0njB9c7Dv0mblsUa0L+uCD19K6MfksVJWA8JFy4+5PShtSFedy6xjgEVa2qreVxnGc6yTRjIYNzBoo/hs/uI3Km/BoR4YQddm35uJOMk+DNoJtb1RZ94GwGJVyKS4fJSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ejzlphn0; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ejzlphn0"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oiUF5LhxlHtYbTxjopkGNneVmugHN51Eq7CGGnZam7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410557; v=1; x=1790015357;
 b=Ejzlphn0Vu+wMB4ePv4GJDq8Ynn9cQqvSpCU10hF+uxC8F80TICdVTbCmo6KiSutmeBR4fI1
 hocfncLt4Vl1ncC8qP1A+6CPpapeUB07ZBKFvbk54LI18nrO88VK9Tb5SxifhursPBzyf2G9+t3
 s7xQxC8rGhmgUgO8HGQ+Mp4k=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 934f72edde8d4b3d;
	Mon, 14 Sep 2026 18:29:07 +0000
X-Mizu-Trace-ID: 934f72edde8d4b3d
X-Migadu-Flow: FLOW_OUT
Message-ID: <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Date: Mon, 14 Sep 2026 19:21:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
 yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
 jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
 quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 10:21, Srinivas Kandagatla wrote:
> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
> bus with more than two DATA lanes. One IP owns SWR_CLK and drives
> the bus; the other contributes DATA lanes only.
> 
> Support this pairing on the driver side. A device link between the
> two IPs enforces correct unbind ordering and keeps the peer resumed
> while the primary is active.
> 
> Single-master deployments (no qcom,multi-master-mode in DT) are
> unaffected.

It'd be good to clarify how the command protocol is handled. Each IP is
probably capable of handling PING/READ/WRITE commands in Column0, but in
the paired option the primary IP is the only one that deals with Column0
and all other DATA lanes are just data?

