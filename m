Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515207;
	b=DDdhcia++2YnYmkz2HKW6Z9qEph5um1JnNzMhfnIKaaArzMCxQJWNvSHYXfOEg0SNQkx
	 itNpxlUKy+FPT9JrjvcLFXEsFlT2Wmrr7ZklUqQppUvAlCR5/Dil+VbNMBSPtVHmN9W63
	 U3CJMW3N38QN2gw9pj2sH6PKhcnHRxK0UTOTqYIyg2ZRHEVVCnzF2bWh0blF4XDnmnKRt
	 dTVz7wUy4YyxkpEErUx19X8g9AOGkz37qcZ8MWcDufLaRShR0uVLIdwVHC2LwUQU/Vwtg
	 pvNkZ0ZnHCAYYT+t3FvRuctonAfMrMwBq2E56V6dSb/KVDx1BouTEn/EV2h6UWDk4Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
	b=QS/tLZEuRZRrBSfgdCqQxmH4GmRx2JNfjy2AwPuLwvgEP6QCJX5XJe86Eg8FNrSRvIR8
	 qyZH4t7Df4yZnoc3vWD4aLr8SzZIgExucr3S8/aoB4iLNcgxZXzWA0HRd3UdcbqRxH7kq
	 eV87PcEsPMv2HVkKaYqwzqDQo2HLeA87sPqI2MQSWJKeKXwlab3X3VgjTybtWjZA+NklX
	 emt9+FOdMQKjY7Xfa4X8E5W5uboYSsD4UuY/qseTpBoLQCp4n8/bkzE7K5cxGu7aAxyJG
	 xxZVhjCrqNewAcZfyeepF5i8VsUFrs8WkyQoUcEHSmzhy8GGjlQIkjzFUJW4hDtJjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iDNxg5/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6649606A682
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6649606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDNxg5/f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8dskO646328
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXZ6L78F6EFUbyACsiZAuSZs
	aiYj54Jynp+2S5EVBJ4=; b=iDNxg5/fCzrJEN/fr6lSGglP+NKGiUTg0bHDgGbZ
	oPvkxENj907CBnVb1tk4xGoAxAiY+79qAGhwrz1hkyrWqfC8oFUGSkHmrZ3/eGfM
	WzDlAKgin54Y9sGk9CmLcFxiKNfkiI3K2rl9+d801pKme6OnqQ1KZJi8HRE7UgSM
	dq7VCm9S+YK6f/zQgWJaSeOnhPfqKPSoZR9HtIstrS1pCDeeLLEL6MMNi82hDyGB
	W4ARPa8jv9Anpp6sji9UegFduGckSPRAUMCpgRPB43O8SsGg/8BLdMpNQyKc1waX
	98BfDijfjQViMKvKsekqkLTLYNkJTSxrWcCnfnSPqfOpyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd25gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so6443992eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515203; x=1796120003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=dMVH+aDSmOzOrv5taCHA3lxNcXLLrnBm22QohViRryiui61PbKHDboJ2yeIPhi9YlE
         KaAkGX82o5ET9dBT2gmYhKVyxk+0uGb0hQSRj2rtV96VJ22fe0tdzg9S/uWDRopPzNGn
         HOA64U2DvRq/Hif9HweGMzmnJEHTzUBztwy7Xat9rvB2HLsWP4v+w+872K9gJfyxOleV
         2yVQjxT4RCbrEPqlQTu54pn8J5Lo6Cdl5rIlAQNvf1IOFA4pQnKifxoGdjOPoVSwMvWA
         6+dvu/P4xDNl1rFS8+L/PbRV+1TRAIj+i1Rc8Fo1kxK/CMteSSdItAlM9htP/tsI3vy8
         dimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515203; x=1796120003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=BiUbycrH7AqHVul37HJvA2/GRdsPr4Mgs22tt06yAl+NqcLCFfkXVv/Xp6mnY8S0oE
         AkCkQPHzr5iUUh7x+Hr12jV09ET2voLKzcp3dSWHYXt27zO1EgXY8fkuoKImy0X6SCKx
         eG4vi2Lop5yDHrIrXZQpOQcg2/zYKiF+GSzonMHoSqDM/XBzI9lewT1rGOl+rH/G+dnx
         VSQYdXxk0cenkfGs6hdyIEn84dyuejlQaesr7Uv/Ly++c2bxXQLh/SCiXok0SzrnqmcA
         nlELEU77WRtcGDSnIHyxfGHxNzO7ceoYKy7j/gMl8j5SMz+HbUAnFCvdhpsKnNRp18Gl
         HJSQ==
X-Forwarded-Encrypted: i=1; AL+hErF+rkTo7bLDuYdd19Q3n27KW5B/0qBtie76W8fiuPlScpdVdqUV5Ru8sPAtvZ6pKDuVFUxHDqs24gxE@vger.kernel.org
X-Gm-Message-State: APuU4Z+rc+6G5nn+C+VhZnqdxmuNKVUDdGHxR3/xRzVp0IBgyB4NP3Q0
	9qMRARib2mr0iObk7xUI2AbM9MS2cmzeIP+xzwzcjJYWdmJMjMiAxq+9IGGHcaRf7ckZF8ITQ2o
	IjK8sq7M19h4u/h40rN/wB9eC2ClB2557Bk37hDJ+lddhE2ad9idmVHELbtrhGD7D
X-Gm-Gg: AZFdTZceUOOccsJX8hz9mr4FqCvzoo5BBax1suYdQQwTLdvJwBAF+JvLtS6jWUNaCJb
	+jMefx5IiGU1BpPjvar+Fyqo+uPz75VYMdQGjR7eqwb3KUFNaOzTiyoxQdTgdGMZtNR4b/WTejZ
	yoATgFmjS8lokvbpGdxLq0fIwrLQ3fJrWO6gE9A5IY+kca1eQxVzfZNO/KrTmdlPEnytI8KkHMW
	kAKpb6riR4BnHIu3I7IhKhGorw/CCiMjT1XeCk9cMOWD+RM/DRkOPyqyUQUqflK7hNRF1VXusW4
	KO1T+yNRRnjFL6S69n+miFV+8p7a5/eLzfBiYqry/ei7wLrHvZ+XsySs2zHdsiu9KBOsLHa7Bbp
	oLBtmj2jDkQjn5CW1twjYkHXOGqfbR5nu7CpjKYJ66o+OF0Wp3yEbO9WstRwrKmKWTNWMBZi8nS
	Io
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143847eec.1.1795515203351;
        Tue, 24 Nov 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143814eec.1.1795515202730;
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32189994eec.1.2026.11.24.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Date: Tue, 24 Nov 2026 15:43:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261124101313.vezsh4klcxcklg2a@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056344 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FHuKVeeB07r6xee7kg0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX/nS+dtHDzo0D
 tGIceiG/sKd3Y4YUPLnkdjKbJ4qWkrzhtqSwbWkCT38OUJTzhIz4ELCe5/4SChVhYGEnpZwKlDC
 VrITcVSRgr/BKElOs4SWCiMsjiH6rBiPNSOtfgY87ITdOd30pvOugICPZyx1IfO4xE9jBQFfcLt
 IM/mfcq645i6XRwJaUpm+rViLhtOg1j0wq6jlsvVGL6zU30cYocnBYj/vq7751bsp+NpWXFLZL8
 eB/Dj2/V/U91bmpKmOPpddWsLkMVsyMbEmknNMUxH8kSd8cyshhrgZ75uKoHaAvdOy7uY6TWM6R
 I1srb1heb1fR9YQfgqUiOIVRi6l0bqJW+tHEPFp58NcCy8lqEWIILUkzgQW+RDihzTLDkiF+lHk
 tU1D4LCzp54PEpx656jCYk9xXwbT779D2DPLEE4hSkYnEXRThQoOdJjijz2tqtvN+hLtZWE4ovS
 VQlpKqdWNv2ndxHwmPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX7idmXq93cvdq
 l5eYYq/PXL58EB5ht9AfxZZmFKs/9a81eyS8Uukso+2th9Ivlkx0aFkZ/eC/Q9DgPNaTgr8FjzK
 eY38Mp6x1QOb0fX9LMtSngyH8wOllcE=
X-Proofpoint-ORIG-GUID: zCAdTan1_LO5S4K1WaF4wTxU6BAyQRuM
X-Proofpoint-GUID: zCAdTan1_LO5S4K1WaF4wTxU6BAyQRuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> The number of IOMMU streams used by a remote processor is not necessarily
> limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> and MPSS does not use any. The existing single-entry limit therefore cannot
> describe the LPAICP firmware streams.
> 
> Increase the maximum number of iommus entries to three and constrain it per
> compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> one for qcom,shikra-cdsp-pas, and disallow the property for
> qcom,shikra-mpss-pas.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
