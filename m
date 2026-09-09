Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79F577E55
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965448; cv=none; b=KIBXvT3ML+vwQ4mv3V/FHmpSREbILothewqFHONhGXJqhY8OQ/PKC2/5vFOG54WFbNCRQfFSGb1/vuvCCxQXF1Af4oKjRlI3cEjLPxVQ76k3269hZ+hUuzp5VxNQ8PHF76lW5PmTRBSKXM6T8iSHfZ7w84Og+2GEul6um7jMUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965448; c=relaxed/simple;
	bh=htk8qv/K4eyGgE6wRDDFxPqjA1aEaZbCUEbrz7LLR28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7FuzDWm83C5Vbph4/vK9SAxHgpiW0TXSPiFxDZsK4XXOWPa3nqFjzxsHKg+sVXdJWaF0zr0BSRn3yV6vpCnD5wJr5a3bPYKYEuh444vkFDOyZ6o5cbxJMLseSvsK6swax2dmRLUhvxKVOPcru29hSKRf8v7ciCniFILX0CamMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7q7mKH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpZID4WT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7q7mKH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpZID4WT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Bogr32698714
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VjXXRzrnnx8TfMPI+JKRTyu
	HaxUZ5vAOhqpXkWfWS4=; b=A7q7mKH777AFl2Ncy+u3VqVNQBmj1KUIZrjTkfzZ
	peKGuE/ccFJ2aeYfnju+y3LrD4U54uUlMLivBADm/ks85lLb4lL26P0elnrKJsHU
	nGCDKbhWqdVQD1ClN6w8VID6aO+R6KO8oM4saf2a9q9pyTtP9SIXwB9I6iaPsUiK
	i/tlW4SHGStpOVEMtXjDXuG5XFIKSabBby4NIf2ZRUwjPzqAVYXSSQbwkeRtkQWI
	8i9Gko8WqNW4y+2TXFI3aEpKWtuddLxNfJWpW/pQ7T0KePl+etcJB7y8nB5aj04S
	fwTDhOok7RRpeoPoXu3MNtHBvfSqRikCdWany4qALpMb1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0spu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:50:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db0a41434bso108080355ad.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965445; x=1789570245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=MpZID4WTbmWZbVfKywYAVsBk8qyQ8pbcJMzAgZg1an+3FGfVYhUOfCRn++sF73gUXj
         at4uK5phfEGLeOz+K89EL6s77YaRxXltcAPokjxHCDgwjKz0ZPqXgrcopTWB5upQOVHW
         3CppTQFiaXcCZLZwh9StT+kdb3hNZ7z6IRg0gFVWD3QVYVuXeAnYyIhJG8B5raFlJ200
         4duyFzDGwkWghe9QMHrg2H19BGtMFmRQptF6ubl9CL3rPt20dgulqvS92X+6N6FzuYyM
         A7hsbOC4QaZuwozfMCIh43fCggdBDmheeew9rrz5J0O7A8eyCGSVFvUswLUFK1bZnNrM
         SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965445; x=1789570245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=OTAKEtBPorvtzuSJRGVtt/gx9OFQjUBSQ7DtABty8gBfS3YaKFHeOluGdtB/Qo//54
         EHug0RvR2Fv6ygU7hFGXbwsEdIVSBc3Fd8CT/PfPouWSEB0cXae2SfQW6LztzOwqmx0H
         7pdA7Kkqjxg1NUFLkUZjGaiNrtYPorn52BSNh2R+aEYNWK1yAPYO7qvZRF++pRwzySzm
         qiju+5b58zF0vSTmvsRMhaKKZsLnUPR9/cuSvBVmdfb0WsqouDPitl3Acq8pEmEl71j/
         daf3qAJBpZGYexG57W4h9vAk4xuS1jYFktAEhsoQ2nvtEVBGTMd+xeZWUxRYjXs6XY7W
         LrMg==
X-Forwarded-Encrypted: i=1; AKwUvBxijSIYnM6lHiDg7tR8Z9hLpuGy1FE/nfvqf1OtOPGJoTEoLou1joSvoVOKcEVZrke864NhzgaSZjIY@vger.kernel.org
X-Gm-Message-State: AFuF++mb6dGNsANw3TwKv1/1CDffdSOfoMVK3+rZxuDbdqo1a5EQb02A
	z8j5zWXnlTpw9pH19x8wknRtauAMeWgV6fApxYUjFJz1nHljwrlbtu3c3zPqyztDsNpDffSk9AZ
	bsjA61m2j5t3JRAOpcF8+akhkKwelZStFIsawC8WtQmicKATNDBvT+V8PFTTAFJ5h
X-Gm-Gg: AYBFou3QfC7V7d3x0f7O1iVdPhJQtn6U0c/CTGBTYiiamTZ+YDzxSMfKcWVaz1NGYnI
	s+315poF23v9JxGV+nxMMhx3AcdZvuNHtEpG9BBZFtFI8616Rx8XoGBRKjm9V9VFpfCL16bnvSb
	1LuJXVDnMytpg8nOYZ9X8mmGeMP1M3AZCzrNN5SduQX6iEu1CWs1XxPMzylcdP7De4Xflfx09ZV
	DasgrAklVZO8Q8lOSLlm+yi0y60yjWGZDGvB4D6gSickR7dfmoK/DCeOArfvAALBuwcMFmktVZM
	NNXSYJzPds8FON9aRw044gxeSQFa3TRjCcRdHAAUql2jZqmK4xJ6edQW/dom2QQ0AFDFyePI6uB
	/lvZxJNd2LKDb2+eZaoGyHCRFk2paRQg6xYTqt0lfZzw=
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22983955ad.22.1788965445225;
        Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22983335ad.22.1788965444698;
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm75371185ad.24.2026.09.09.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:50:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Message-ID: <aqFyO2iX53-Ivgnn@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX/hoIwhonYNZt
 /ACZFszEq5mDutwVdcgiZxxdAuB0+9DEmiEjqegs0pv5aSrdJ/w5FrL5Y2QJ2YHkMwBie4GH0NK
 foinwv+P+5NJL86dnsyk1LicDvTQkhdCrE8bWWbBr7MP0UrL6b/97VCxRKGQOfK1Z+DpCih77hB
 WaWfttYrYvPkAcUsvZvGfDRyACFlD/fY+kVofnBYaSMMY4SRaaR8fF30pxjjzVzBUh54qGEQTUJ
 sgeeXsl/+sxddhRGCksJsuVhb5tsM9bHTzESryHoObhUjQBj970hMRFOuEznX1JAA3IMJe4W4I5
 isGGk3N1FGWP34aL7/bA27xFYG7SXq4qcZB0hdF7mfR/hOZWPmav1p6uyNUPu8HJOfGnO8/+AQ8
 nP8tAEqcRG5Zoh28d7nTvSqPJdkEpRqvfvG2U4fle9O5j/SxGd9a5E2yYlu/u72qM69lCy20kB4
 nDcDKEw/gSAAYUYMO3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX+2jGpIceoCGp
 /SIpxkPkAkWlVCn6JVADtM3DopRl38oeO9ortvtuka9I8WJf3qlGkuWuB38grQ62e+jF/SgUvFD
 WigWSkOjn8D7Mxjk6gWPBCjCd3LoV/0=
X-Proofpoint-GUID: N3GoFrqgIIiGdPJaZ-xAtiwDeEPDFLYP
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa17245 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iZO5Dqbo_VVVwkFoHOcA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: N3GoFrqgIIiGdPJaZ-xAtiwDeEPDFLYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On Mon, Sep 07, 2026 at 11:39:43PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 can use an external system clock supplied on the SCK input
> pin. Platforms that provide this clock need a way to describe the clock
> connection in Device Tree.
> 
> Document the optional 'clocks' and 'clock-names' properties and define
> the clock name as "sck" to represent the external system clock source.
> 
> This allows boards using an externally supplied SCK clock to accurately
> describe the hardware configuration.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
