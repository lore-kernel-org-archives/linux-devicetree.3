Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E73C37B6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442883; cv=none; b=Ut30e+dLfdG48nEjvsPXX5cr7+t65xW5HvuejIqj099S0uqGc4/RpKQ+x91jdovmpaoagAjExbk9QbE14ZZAu3CkcqehHQ/gLiak1k/NFITxdGVQgq9eBenuRMkUhWVhFOkX819OWFn4waT3ZFeokZuXKcT7mp1NOdQZRgxxCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442883; c=relaxed/simple;
	bh=zpSiYK0ym4AS+OVnCYvF1c2VXPAirNOP6LPz4zTH7o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfAJKOtR4YJAO2z5csd8Ph9IzuBWSTxgYHkX/u5dX/hWOYkjMzca7qrl5TVFm5DN89nOtzD3yBfwW5qCDHtuUTOtQrVa++2JI1+9mQuWr1iFf97SEzLMGuhwWoc46Yi7T1n3aGoJIJHXn37TCaEEWB5kCVM26uACgmEHFfcaWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTn83EGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iko1IkhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTn83EGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iko1IkhV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8auRb399343
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=; b=bTn83EGMLABe8cQN
	/TKfn+D9uSd6l2jak2XJgHD6cxbRE6E9KW/VNiCUi7Q6yh8ybCIv85doRvFZEGih
	nZ4ZpNcAFqMZtDTbT/Jg0B6lPiIP2NDa3HddEstiNRzbdazASNnpdLOSoacviJjF
	iZGjwHKRRs7l+jOHboE/98iAGDIrB1/7sZNPqHlh1IgJID/IOCdXm9r65Nw5oxzL
	k+Nui/Fytauq6dtQYO8rlzeornbvLBBL9wdQKiaR0Mb0YlcedetQm5N9/OevRPAQ
	vQcnk8i6DOWb2QMGoS8/5FTC/87Eq86fi4Xza6xhCtbFPLpv8hLKsS7fn4APB05v
	bIXGBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9uppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:41:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so22717911cf.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442879; x=1780047679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=;
        b=iko1IkhVGLCW+NYQnFMD2Tbj9GcCtOtetqz26yryk5GpcAwS2pjHL6re5Jh2t5Dryu
         JTR68dMc74t6o7rOpxsR9JyvO7iKUx9ttBeSI9gJgMZriWqGCfYmRTWyFsRaBPWpeus+
         s9yYRGsRLfGm5bqSa8kvPt7VZC9YOsq5LA4qNnBzetsU/9lQu12NkJIcC9MSy0qC4d+F
         nbgq2gRrlUMbDRKJoFgXPKSgeDlV/k/on2CaCJf1CKBSDP5b7dWwgncO/PxVquKf7JKW
         /6SA/0P933B7Q4a18VWfW3k0xDI4EFRu/QZMA7xrZcA7TLk+c58iDnr4ceKvxjr0W0EV
         QkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442879; x=1780047679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=;
        b=jBd/C+OE3ro8db+yFc+C2QcKLHzjSQMLvY7RCAFpsFqiOBvJEkyD8l57Z8ohdZWdX4
         IR9p0zW99cQhbd1NVCGxjTQVMEppuxpsSOY9ppAXNZMwb3wktj90Lf8rhjMDUEJMpbcr
         RvjAk/NOFt8ghl6tWUFS3IJF2ROUW4QZvYJC/oAWMseFiRHC2glEz7GTaq13+cOzFcuF
         VJX7QzuAbip2pirEMUjat/yihKaDwtT/iTjaKNU08cpK8/+W4IkDqafxXsWhflWCdPAx
         Bx4IkapieCmjyX2+QftOZ4wlar6JIpXmqVyy/HYOtZifyrKlX+j8HUzH2PpOkl9UU5eM
         TPsA==
X-Forwarded-Encrypted: i=1; AFNElJ/mMKZdlqrghGaMgshPhSXn5wuXxhiA1ni++4DW/CI/YW3j4L+Gm1vq1FQAO3h4KSVXy0YZPxs7+Vxu@vger.kernel.org
X-Gm-Message-State: AOJu0YyYh0vEjXh20SlMhrJzij7e4CJQzAdioekEf/Sjr6zrBEjojcTN
	Fxv4qBu6m0qlMDbltwXlLDd2WBdtLsi9cQEpwslj3gosJV+Z4Y3MXSZdwBg+Hlmoe5j3w99Y1JZ
	UfUMOZN8HUxd/17B1UjcG7gbeDJafi8u5+55VFGh1YU9c2Abh8fM7SjBwKg8GCwEp
X-Gm-Gg: Acq92OHu4AB6EzGexwXkKTgf8guYLHLb69slJvzcWCnxVU7iFpN4zq2jMDeIAgjLMjF
	zgyn9SyZNoP4hpjWXsuEgdEAw01X0Nz9eSd+h7+lrHugpjusp3BykrmxP6gElYVMDVWU5HVk/AQ
	2ikMXWx+jUXJfIBF/EjYIBL6KAJZdyJ7iBt29+v+7W34EicSgos6NrTtkbgGpokAe2STdzSvqkM
	Ks0Qweaz0VqlzWUGXxKWreC6zj6RWOUxBBUuOf+6XrUh9lJ3nkKTqOgZLtHNYOhrZnfsfBEdVIv
	CGKw4hdnsWQGlsYmZ4gk7a0AZg5lc1fvwP5OLd5huNnhbXmmZt7smHIBETc8my1QeqAf4Cbzc71
	4XhkVzB1M4Mneq/z+H3kOr1bATIaQ2BwGYCSHoV2k//v9Sw==
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr31559751cf.7.1779442878794;
        Fri, 22 May 2026 02:41:18 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr31559471cf.7.1779442878402;
        Fri, 22 May 2026 02:41:18 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecee74sm34905566b.29.2026.05.22.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:41:17 -0700 (PDT)
Message-ID: <6f302a66-ca33-414b-bb80-dac5d9ec225b@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:41:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <20260515-adreno-810-v6-6-fbe04c7203e1@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-adreno-810-v6-6-fbe04c7203e1@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a1024bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ct3XC8PptM1zmpRJzi8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: m0veNlE3MEXK_rzqpGLu8oFLjfMFo_Iw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NiBTYWx0ZWRfX0QgbMRktEzsY
 +sEEN350R5e8xMLaQlBb3Qkmy0uWD9MSE3H4fTYoNnWJNfzfC/0iu4GzxEXl6wa89takvn72pyE
 WsBEXvvLFjEx0Vvu2CQvXbzMZMIC5pFhuGD/ICiG4AUIhogN6CTbtBgEZzFQGlqm85v+jwS6DNl
 j7ojboiWMZS1HwMJcsqg/6Ql8ak8EYq7nglVAonB7vK34ApHPNdvDQ7nBHYQr25C6V6yooKAMC0
 B1obObNXDyBpxfm6ItyOEJPFMPhY2i4nFFCWYJkIi+1RfzV/X/cG793Z17AaVQLdg+AOKNRHhFT
 hrTCIO+Ti/7aksiiO6K5Sd1a1s1qnRir7GiZyw4tTosmu7EzOud/thFdRlQ9Q8k2OCaag84Pp06
 yhf6V0ZWHMlRiWvlM7jOtF+Hkjk9jxQutO0Yz1rV7dLrdMZumD8y3feFbFTxKgggE0T8qxSRyxe
 5NjImWfWPjA4Hoi55Lw==
X-Proofpoint-ORIG-GUID: m0veNlE3MEXK_rzqpGLu8oFLjfMFo_Iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220096

On 5/15/26 7:09 AM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

modulo the speedbin question:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
