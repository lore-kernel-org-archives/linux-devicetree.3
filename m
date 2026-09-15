Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEEF3F4829
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466846; cv=none; b=NkbfsUtMDZSqlNeYaZwZJel6ltrQCF5WXpELdxZ1lK5RorvuiUhWRQlAbEmcVo6Rbp4CGq+HSNFHxryIjNv2rROuyXzXoGtzEbHsen2iPWqtQPT0dTDoFiyZX2qNwqg+gvCMjpSuFXD1ILh6Z/teu2frjXBmAN3uicuUe2A+Cr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466846; c=relaxed/simple;
	bh=4NnZjRUVu99jrye7JSnlXRWibjbFKRH+qPd28f/19NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quTMyxD0AbqCkuUpTRKhcQlCnCrElgYK0ZhnNlJvcWLum68PD9OfhdfCIIzvIOyKwwfo0dMEKMrCydjYOMHwvVpa8qZDD1vpTt0xvkMsdU7PYg/xQT3hLvEncbZO3A/J4NCncrvH7hpfmeouJKov3X6xnumqoH5cY/e53Xm7c3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lE/29OMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTumisXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lE/29OMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTumisXo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1jD2086622
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3EbqVKyJgeeUxy7u+OCjzBW8
	J7ZxQ/YgQrTIGyxwn48=; b=lE/29OMhEPt3agAAaN8lLVkbwNf01c+u0lthDPyM
	AqgGh3wVAtqo7cZLNpikX2kl6WKRSnSdxyWrFxoEfSH4T03FebAp5QMMVAjitqv6
	9Sj43gD97f7HSkf2Wu1IZazRNPp6cMjhv1/4mHPwSS3bLrxvqa5j/PtFbng6QjBX
	WFBFUPcEmhIa9mJpSgURN2fNfkLNlDXXYO7Zz/tzXGtiV9giXjYlRJxr39O8pVPg
	y31MNYFsQGPQkaDchmw0LSc6kSZgXLl4b+a16VEzqbpZ+7OAHmO3pHXHDlkG0dg/
	r3UoEL3N0IBDhewa/BIPfwcVNiRSEm8Br7CKdu+rji7ifA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8rpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:07:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso335777985a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466844; x=1790071644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EbqVKyJgeeUxy7u+OCjzBW8J7ZxQ/YgQrTIGyxwn48=;
        b=jTumisXoUtQWR91YaPP9tMVXEnR52ha4fCcMlbGPIzkRBbd+iiXhbVvDXO/xIvGkfl
         eDQhLKUdpCo5SwOEyn9RmAxEnZ91xCp3RfRHYcNvpAY+cUC2yDJLyYalfr0foIJCRPZ4
         EEE6V+/gl+JJohTKMrJOiN3SBc1B8oUVIyE88SCoXes49gGsiFQofcX7Xq4ftM0LGP21
         2ic3Bjwj280N4dNWwgMc4FTkrhRUt3rYNIi5ZKMKhbIAl9nD8C9Cy1TvPlSqVSss1WcA
         GKsY1mUXNnx72bX9Uh+PH5gCFIHWzvnmFPttZsbfuc0n9TSgRK8pcIKFq5nCtdKdlfO4
         h66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466844; x=1790071644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EbqVKyJgeeUxy7u+OCjzBW8J7ZxQ/YgQrTIGyxwn48=;
        b=YdBetNgTA2lYtGFDlN6UbmAZioO3I+8NCW1RyKQLLGAEvngNnabjfRQFTb4CUUvdGa
         CdbDOAUCmSPJlenwgFOf/gdSKw+hLVuSjZ5F+UKsEosy+HwtimnmiQ32ykMzRK/D48pp
         3da7xB/aQPsV0xQufXnTz1Oib9UBcN+WUKC+UQyJeK+yMVwUMuk1czlNyZrcuKs85hju
         8P3NYRifycEwTpVUIOJdfCCXGZ01/nPT5SmD5N0ZaIPztOtPB7b4RUUqp8YC5819PSty
         n/vyQU50EWC164nsTGtMjVz1U8ttMmNFeqeqxgvw3CYyzyfHyCv4AijlpCp/vBnBDWYs
         W0tw==
X-Forwarded-Encrypted: i=1; AKwUvByeMrVuOsjrP7ST+PPsWb7afq1NT1Za6hoGkSIFSZSxZXs8sllLthqVw0BnG/02xqD3HixenkUrMf9Y@vger.kernel.org
X-Gm-Message-State: AFuF++knwRJEFOfK2szz+L9x87kpTw9uveGE9dKLbdLIiFLxnhZuKPsZ
	IBGHYHckUWB6DJOwDup9aZZ4UOhl9HxHEwxTVktlCE9/SmgWwsnNFU/hMOmqZwY7f68+qihd047
	8u4vftZkSSTp80xaCNREKifXDcQs5Pv+CqiRgxH5RaAwkG8HfAhBcPl4HBQbgfKoi
X-Gm-Gg: AYBFou3Sd46WOwjtscK6lxr5rzAHs+ASpaWb1RpbVFj9XtAGB/w8CKlGpCn8OafVuc+
	CBfrz9siFEmqLgTiU1Mkk2m5NMeU0B1pTjU233pobJudBRJpIdlY3FjM6V2pKyKVJ60wh7Fw+fU
	ECeMMlV6oWlDwUME+fRtD1r4pNtOjT0dinOhScCgwuyyrzyzVDjT7SMt+uXnSGeLGnGxbUGqmZY
	MtBJQ4q8WaYzXwXJtvIcGhp7r/qlrPpvOGIUYZTYPL0QVqz1PfuFtqxeZ2F9JjeK553STOjgpNN
	RYY2KoB+IYGjzB+GprbxKBnUJ/9H5CAhFedv3YbWG4pdczO+MTzXshsER1vwuZIFbz5Op9pmOVn
	z75gMYpGWQF1/gQ==
X-Received: by 2002:a05:620a:2590:b0:939:6b87:9a62 with SMTP id af79cd13be357-93a408436e8mr8790785a.38.1789466843816;
        Tue, 15 Sep 2026 03:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:939:6b87:9a62 with SMTP id af79cd13be357-93a408436e8mr8783885a.38.1789466843115;
        Tue, 15 Sep 2026 03:07:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm34316561f8f.5.2026.09.15.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:07:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:07:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangtian.zhu@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Message-ID: <bmv3w3mp7mmi677dtdhi4rec4w4gjelv2pnkj54alsonjnfety@osd3cydvceee>
References: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX5i7z3O066Beh
 7HTi7SlsfRocyt0UfuDbJ6KItFnbVAk88vDGAy51nXkYgNCOfdft2E5a2wbyorXLKOQ2NOjZvPn
 2BDPNV+odW9ySoV/4xud+OH+eqfvip0=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa918dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RqneG4JXFb1X426U38MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bIEmij6NbUOw7fLZyGjkfAB_3q-wOybv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX0xWbt9DULuuL
 FFPFlVV2SBpg6fcGRaWrB3J9hSc++WJGZaY5jQpwJ4kRJR9mUaIYYxMsGC3i1qi8+XkzD4CCVQx
 BM1ofWNoTO8EFrbk78IR5hNjQGzlQ5HVWHjuzkRlIwsSEIBP4G+AVIUktG0ju83gTDkio6XRR4+
 jhKmIZCCjtB+FJjuwWoOMCRkvkJaDpu+BqUK6+NQsrHLK37GokQlKYfuNkrb11B2jwotkYmBDS8
 W6RsXJciRPcSF3u7jwKGAR/tc2NkiPRHvgXsY0WYyP8JocFNLxNTcs4zqlit2yDeaKo+qDHrqee
 OSzQEyNzKv8xxoMdF/Y3dnFwc0yUiEB6c9b7eq9caovER+/foR4Lid7NOWehJ8zP0/FQ/hxQB0O
 XTk3p9b6qN2dYPZHDkHV1TfKdwonn8t3kgkbtytWQSGWk1Okg20M65XaJikXk+R4Lr7ptVBUZFB
 5yqsavc6MxRogvxf/tg==
X-Proofpoint-GUID: bIEmij6NbUOw7fLZyGjkfAB_3q-wOybv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150145

On 26-09-15 06:50:20, Hongcheng Zhang wrote:
> The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
> PCIe Wake-on-WLAN.
> 
> Add the wake-gpios property to the PCIe port so the WLAN wake signal is
> propagated as a system wakeup source.
> 
> Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
