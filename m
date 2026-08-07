Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A53AB26D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104685; cv=none; b=cOBJMipcjpru7PJMfuSyZhP4A0muJIekKe4bW/jdcjOuE+ZRAYp9O+HZvYdqPAiWBZkUpbcLaAUq6q1a5NBCbM1H7VDh262AJASPocmYWWb8s9J6aKZkx2ANq9N0LFSO2UNwwboAGahlGH76KhO/3/G+PxRrySPeIgRt4Mn+CgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104685; c=relaxed/simple;
	bh=CYWwPcIDbgZJ89d3/zXRkb7tZq9j3PBAauv2vSVKr+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKHN6+G7k3DlKl/tVxtv67b/95ZPUDCXOsbgKCmz49sibKI3jUfA33aTIo/X559K7pRlEvoCBYHGUGYl+oyhXfNgyX++xbFHu4QM+tzzzNIA/B2FaEAfNpWNuNtImukjMmh8/802SPHOMDqFJ4g+yt1GMHTkZkFdchhobKMoYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcdIfSMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRtPPueM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcdIfSMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRtPPueM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777gIrF3478244
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=; b=fcdIfSMuj3HLJvrR
	FVFOIUGxLVpO3A1PWuCnkR3uTVoeQDD/YnUUd17H9FNeggns0tluDyvT1asx9JrH
	f8AEeVCEVlNSoGMahDbYKSHDa55cxKM5yc2LplKk4A04+mVj3/XLRA4bYUNm8PoJ
	uJXzwOw3XaBaqpcoXGqLCQtlAIBHJ/LLehKXYkGpF4dDLcWowGphWBkhXUwJPr7t
	QCF7T7fWn2dBQOqdrfZTAEmoTPrDBPIU2eMIcEMGRoEkyPKfeXTylw2AJdH2odfN
	ZuRf0wUKftiQrppaYOWNWLE/ZtAPbkXUAP6vMD5l4RHrND5PW3N+OYsamJS64YxP
	qzwL4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hbtgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:11:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so26740631cf.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104662; x=1786709462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=gRtPPueM3lSbQwyy1tVb02xHZB0qQXuAkgYkKfv7251VlfR7EBG+4n3SeBYjDSxYjR
         +osj0mRKBb3tX4ujm+/Noaaz9KwSNoXmeJ1hLUvRsWUfo09BW/mNEHea6Nz9ofZgrOLo
         HKeL39VVWZIifUBrGGjPmt2oIJFnjFAQfFdrb8v9+QmL+ZBYcoJonXK9OblRBvFH0V7T
         JPJCXPdpVAuRQVQyKskcrnWnTVHX8jfKKgx3rGfhZar0IBdRH4y7RTawWYgcfWwqaxut
         nGA0qCEVbO8Ow35XLcyx8ID/Twyz/f/QL8W4iyjXbac3lUxRLCFOmhDkLYGpZI+Jhg7t
         grgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104662; x=1786709462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=ZiYu5235YMvMC/o5NrVhektO5XxZXOM9P5o2/2OrV1oy27+hLO8M3lphelo56GSLxU
         ZLvC85Qb9ZGKYdUfOUilI8OcaRyT1MgVoVmsuaV/o7c9WP+975ZnIAkFFulNfDe0zaaD
         fF3SMUbAXOHCap+Qh0Dj4ZppHhIPmTeINkakJ3503kUoCY2x7E/zqyUBl8O8VWy9AMqT
         VWD2M+L1fRJWfH84odoJYQCE7yhz1XAauIbfy/aEFeDvD+0k+dNcnr/TffcoJGlBo8DN
         vP2sDeWHbaaxXv+uPAmaCPmLjSObtzvSZpP/PpiZ6yZ2dKPix9pZFpxgCnQwkWYcHBVf
         ftxg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3M9Ldi3JzCxr4s6MorVgqEqA1qR74mxIiwg9zeobGsRiqK9WfZPXlVibfUKhOcJiunOmKgW+6oTDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTBIMBIYDPppRmY45g7fWv8skeIOsVqKUs8vCyUwx1P77/9z1
	ZHnCO7VGsuRkqeMKh8nhzEpTpC22WEFXlTYK73eYiQyU7wnEmKADSKKZ1irASwcoNo7GkZepJL3
	DogrYb6SFo0+qHAxZodEG9XlyCrNh3wiupc8HsowYHJ1/bHYYB3fVrBwrwr6dcodE
X-Gm-Gg: AR+sD10sJ4Vdyx0iuCP1RqfZKiYYv99PyO5WhvMPBwsGMGwlSWTGB6d9GnIU0lyV27L
	oXSSqQXSDWkk6vYKvP0/oFAXooiNdBHz4l9rPh1W346ruiff/nH7kNqrOaYZXW8U9Lvx1e0J4e8
	kERYaJjwmmgo/3h8KuG3eRr0BBjzY9rVolaqnqrH3Eve6SfO7Wftmn1VCvNrIgDedSuijlWhOQk
	cEz2K4JQ7c6qTDP8d0nVfmJd4tX21hdVjuOkWVF3+VW9U2xRlTiRIMZNGCICo25po5Ptm8sEb1f
	AuuVc/7Qv+dn55N52z6d+6Zej+00x5WOSLrCmvtAAzXWJypQrxe2/x+Jqu1eRUkCWd+Okxfs2Ny
	oDNlU6iu4faJbYbxLAO8G+tInzjZy50pGkzGrSXzXBY7qCg==
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247582711cf.43.1786104661730;
        Fri, 07 Aug 2026 05:11:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247579351cf.43.1786104659899;
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea27b29sm41957535e9.11.2026.08.07.05.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Message-ID: <14ea9fce-2bb1-469c-b751-32f7a2e28f48@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:10:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] lvts_thermal: Make reset optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        rafael@kernel.org
Cc: daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        laura.nao@collabora.com, fshao@chromium.org, wenst@chromium.org,
        jiapeng.chong@linux.alibaba.com, frank-w@public-files.de,
        bchihi@baylibre.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ldmx0wihjpAAPCiH1Lnu7C7LdukG6Mnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfX1+yXH8gRENb1
 b5ZlNuDxoH6p896m64mUXQLRN6vcT7gPtsjKuoHw7IzCvz0aN8cEyOoXZepWAXMmoauUINDE2oe
 JHckItBk+kiMISJOAGE3DaiGheJ6V6XB1pByyuRS6u04+ZMrHIM1CnXd6FNx8hOU6qwkZwPmpoB
 mrcMzW4ZLGxRTblA9GhKtrl5wqEVlZtMs3GJQk2j01Na/L7F68oeqVgBtQp/CywdacYjRXfx90M
 G14vQ9pjqvVEN90vx0JANCs3EKgUJh4LS30+fBNz7OkApx3fVAD575nvZSFk0Vom77s52zb3vno
 KaqzcETov3i5REkKPOi9vDe9Fzgs5bGaEV8H6GWVk6t6NZJDRJDY9Gn1TcfKQoZCc2DpNewteP5
 gjtd+dJRqUe70dmdmhtvJaCi+ih8x3Jsnpi4WqnYvA1VuC/yjPkHNWTzjEBSPzO4KY7oIb973es
 lZBK443P+oBMAgji76A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfXw2Rc74BLRfiE
 GqJSfcEoncmEdOXo0xnDBEPwcgyBxzS8d1RUYsGlaZhhEiGYxn0+C7drWv5Kvwm/mkifS2j2heQ
 NCL6NgKevhtUA2jwsxMLqBUtrt4HYPU=
X-Proofpoint-ORIG-GUID: ldmx0wihjpAAPCiH1Lnu7C7LdukG6Mnc
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75cb5b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=rXlwX46IFeUSpfNkUDcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070094

On 7/21/26 12:52, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Added change in bindings to allow resets to be optional on MT8196
>   - Made the code change simpler and without paranoid nonsense checks
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: thermal: mediatek: Make resets optional for MT8196
>    thermal/drivers/mediatek/lvts_thermal: Make reset optional for MT8196
> 
>   .../bindings/thermal/mediatek,lvts-thermal.yaml   | 13 ++++++++++++-
>   drivers/thermal/mediatek/lvts_thermal.c           | 15 ++++++++++++++-
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 

Applied, thanks
