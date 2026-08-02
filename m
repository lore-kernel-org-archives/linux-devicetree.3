Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D3B23394E
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673394; cv=none; b=TV1Q3aE6EbUlrUOXEnYSFOZDjsktfEgL31TTl7onBBe3M5U+Obe0QWt7AFPlgd/jC/+8sJKXRGfCH3aqWTG/tWXKv6uiGIoGdEq9wjm+CxVnJiqC4czTo6IrMOatRsHd2wqHJq5az8ybQlpymrxmD4meDZ+M/0cDH66OmRUrf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673394; c=relaxed/simple;
	bh=d3G6fsvDUyd8a7cHHoUgKbY30Ow19+QKBIZ/+G1/JEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qioeDe5ADEt7FT0CXXc//w2SE2rUyE+o56D1vut4ptSP34cqeXTn63V5C/C8pPRo7sE+ybLt4GvwZ7jQiqX7NDHPoZaiJugUXgt3l9JkXJuKPjFLgNAutihZaxEGqUKQBOLig8VTR5X7NGeRgSIYUn99lBWjsOoQiY14NDxkD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEO68Eab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4jQK9Gy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEO68Eab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4jQK9Gy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6eSP1487262
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 12:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=; b=GEO68EabEO40xypi
	3RDaP0GYuEZPwY965JPsjwlR5K3XSfejlRAi5tOiIIAINK/eEMAMfm5NaCBqezFK
	R335yG8PMcO7ASkoztcqb9qcByG0blHBQ/uB+YdizJ7sLJjnOw3/CFFTKOvDZAkd
	JwVtXLLNY8PUndJ5ItcJkXmX6zrESQLLiC+Cnw+h79bPXklIcLn1aesyDRCa1Cp6
	KpHKwvhIy+ol6Q/7TKwuZywGG/vKGHb4U/ibCzjkvihBED6KvwN51A+W9OorZn5t
	d882U2jW1tXji8iFObiwlty+xXCxI8NQDeMKhU9HTltjRhKF14ah5QK4ARUgl03M
	lgDKuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6ju46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 12:23:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so238975685a.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673391; x=1786278191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=;
        b=F4jQK9GyKm3kRWK4IdCE6HYXZ2CYMG2NYEdVCs8p+ZIvr/zxPojFOqnYMPWpGDpzOZ
         p++CT6sN68bl6iGnPTx8PyE0GIvX1ePI+gSZz6r+pN5tY+TDWTRBWvWsUNMgV5udXOCv
         6zksZPK/jq6SS2R8TmUxy5SjLswSIGaG+u6t0qHA5RbG4eL3IUYswHG8PHIQ1uBRNldB
         EK7OV7TyN5m2zQ9MVuvBhH067C2+5OzIYCUOwaxn4Fl5TbJCHqfzZwbb8JYT8k+MkKH3
         VyiT6RTot+JD3hAVKem82HrODK2aWRfABwzTzMcAx9ucPa/BBqg+zaJnIYIK6s495/E5
         tsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673391; x=1786278191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=;
        b=M1PFrmZV1wytRFU0LPivdg/34G4T2u3u80tTcJGx+WdJ46MhpHfKCh7S29EQwm2b/Q
         eJsZGEHbiOWulFZj1Aejxse+fKoLyVUkIiHUH/g5Lr5u7csJBcw1taH+wwdlFzbCPXsZ
         l/T0bK62MfE7d/ARTgUVIOiITytRebI22uoqs6RS6m95Lb2dYOKIIok3JJPiSc/6hfBP
         DPlXfV6dTVtW1qHpWvCgPBHoYhc7gLN3lyPSaTjqa2UhfhN0i4WLessfM3BR4xGkPA2k
         kcLu4suYaZF5QDUcuabIXk17ajrel49uhyu8ihsz8QSZxT/+Ibgtryvor9OpFDdUmA+9
         T+Gg==
X-Gm-Message-State: AOJu0YzjP3WHM5G5lx1q9Eg39ga9Vi9TaJBbDqP5zpb9Qfhkrr4s+rqt
	klFfjHH+WVJL68gn5nXcWs2joauAdRh7DjSyKMh8gfqu66KbGeX4jDMOzqg14bdVZDzwDFIMADY
	kgxjI+T5KOVALfivScPALRhd/SD1YpMCWvLEqXlS6Pm8VR1FmxbF7lFLHJwmZYwv3
X-Gm-Gg: AR+sD10saTEmes1G0gFy+ZrJHIe3djoLNc+jbXnzJzWoC+vXGPsVDiCRdkMdeYmd+Uc
	bXo11BDJQntZSIXhanoBH+WpMuJbzCNR8EeRbALqk05vf9YrQb6a5qUCKdjKBuhtOQR1CwtIfut
	g3sO2VkwXlw3HjLcBIOqazb4EPjVadrRmGjLoQbpjo3kjhRvVotKbjUQPmdCAatll2ssZe3A/jh
	2R9on5Dg9aikTF2Y0/ekHomI9zfif1TJHI6Rp2GsbXTthsw+HcEMngf2gnhWX2L3T28LP+UUW+a
	7gQgIyVcmVvqwIR6ojx4r0hg6MRnLorSTzTVtGChJry6KzhAxyIrQQ+Ov0qufoirYx5y4PRjnlu
	Wti9xpvFUVICuF4W4uwOsF5Q1EgGYKQ==
X-Received: by 2002:a05:622a:c87:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52b5674e736mr131790751cf.24.1785673391148;
        Sun, 02 Aug 2026 05:23:11 -0700 (PDT)
X-Received: by 2002:a05:622a:c87:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52b5674e736mr131790241cf.24.1785673390737;
        Sun, 02 Aug 2026 05:23:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm129502085e9.4.2026.08.02.05.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:23:08 -0700 (PDT)
Message-ID: <23465ccb-37c7-4cf8-b143-42913ebd8bff@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:23:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-9-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085153.E15A11F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085153.E15A11F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX9DdinN0ePjVr
 wSOBF6aHZ9pX2dYg/N2Jn7RFt6frrWHRhezziTCRb4IvE5W/0SkbmTpDTLXTOSKNHUzf/xzN4IW
 loF+4GWB10nk3Z8Yi5Au6SpvkV8woT4=
X-Proofpoint-GUID: Nkvc9m_zL36Lb9Np6pvHjy8whhLx6eAe
X-Proofpoint-ORIG-GUID: Nkvc9m_zL36Lb9Np6pvHjy8whhLx6eAe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX5kzlNcaXf+jl
 t5q6QFBf3OrNtJiGnptG3ycZ8Q0A1YydZWzYdqdBv/q3uDwl2UoTwCmaa3m62PlMhtf2sKa9LcW
 bl60ES8k9hHe+5aHxKPyFqupUk+MreIFtWeP1CpM75cvZWBL6UcWLkeeZEDHEHhDvPZyPH4oY4S
 Id9vqH4xD8sOoDva2HbjPhN1xNtNK9PIKgt3qbYsF+E/zcABgjpgRlHRMTOKcBpO/sv7m2edmK7
 6Fsl9KlxNnepuuFqvmaGTznmTwSxH8i1jfaV+9AZaFjD567ddj4C9quKqw942tAs54UpTjXVvqL
 7d9yO6basrw+c0hBfvCjGmTsviTv2fG37+57e5TVAZ6lG8QxeVlGfNZeXZqNQHMcbPmga6bFYI7
 /fK5AQi/0jR2TpBX3jAstD8mFQPOOhbThZZd4CWK87uDyPFM4g8mcTqoDPaasG8/QzhIkxIspm6
 A5+2fhojBKCSDwJrCKw==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6f36af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=SkIldjUxJnNfoXcuKiEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020108

On 02/08/2026 10:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added test fixture `dts-trailing-ws.dts` lacks the actual trailing whitespace on line 5, causing the `dt-style-selftest` to fail.
> --
> 

False positive, the trailing space is there

Best regards,
Krzysztof
