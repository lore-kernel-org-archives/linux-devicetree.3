Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9B392C3C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562890; cv=none; b=nAdw3AHX/m/MQv1ANe5YG2bzAP9KXGcwItHxxz8yxBw+b9r7H2dXoTtqbCJhCtsmsuGWf4oE5Hr2IwY9O8x5orZ0kXAdSYWd4EEG7R+mKhtSMxvULY2/gJgJ1Epua6OvA1bdDjEdBe1ufFFPrldOalBQXCi/1Ras5R6Oh6YmVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562890; c=relaxed/simple;
	bh=wjBDqucFrRC45yMGo+rPsfNjFdgM9qjfUM6yowFCPEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGqF19RHwNJuSoimeuG4R/MyU/pvqGs1sjoM6EZBWRVvJyNHzJpYnxaY83A7p0n7qpgqk80wpLpq0wxuOhp8HlI2zUnI7o6XskbPFQpDfpBZDdm16g+FiSHakS/UpbCp1bI1LuruoHQho1akxDyMh8lWyoFKKo/ALIIgmpuIw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asRfMmz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XngAxgv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asRfMmz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XngAxgv2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9A3q41510216
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=; b=asRfMmz1E44tekbH
	Ma9yQg4lA4ttV10merKpK2tz1tKnR/6PvbKaPam9uuz3egvVxWZ47SUN8GZCKD0v
	urQ2BDB3M2fWaSp+OWhbOxqcAN1N1onYVt9A6i00gDni3XZ3KeqIet8XeJRtoKNh
	gi/5Strk4pGU6rvxbQ2qXu4Sxsv4fsgyyvzw91nLkIVFkoBCncReOrdFwvQ20jxz
	ek4YyLfJhp4ZAO9Dywd1PQQSYHWszfJpSgObyU+QTORik6tnSGRBTl3XXtqutFh1
	ZKGwtKf3xhOg/OV0K4Gh5Fn7CVBpcX/8vbF4ee8ZM/aCgG8Cqai8QVH2kLFRWis0
	w0V9gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe6e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5964441cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562887; x=1788167687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=;
        b=XngAxgv2wV61myCR5t68nqUxfGQUdAkipXjy9K2u0oaRzNbAO2voZAezV1crNnVaR9
         asr2KctNPoY3DA3aOsGVL7RMml2ZE6qE/HHwtijtyWHmOv4AbQUiqcseiNuVWUt6Qijq
         8HJuA8x6/DQdXDBSQECqn7LNz4Je3kbGJmifRuGVKWa8RaKH6dlaEzORKxXIFZEwJXhl
         CksadqcnmaB68JeQO/lZY+05HrKq3nB/M2OS2e+WuinBf9V9yEQxfZpLEW2SKGrkmJSp
         aAw59yKtcrCoeuqnkh4wVCQNyEdoR+9rFDvZGbDFiy9gJxt8eW0SPQZC4hbNv+4yKLeu
         SWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562887; x=1788167687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=;
        b=q7OaI9/PsiyBroZij/P4wG0ZcTiihUNCsmZBy9l4RzScebIaRraVJ6xoxWzq3ZLXfZ
         ioFnR5qjnADaZwTqKpgc9XbNC8T6eDHSRlHDr998CbBsF4MV+Hbp4V/T1kUO9a1n8Ni0
         5mAmAMLRC2S7/6uKjTNSCSHwot4lGWniTmMHMC9QIp9ABXDEugCChPmm7bDDV2mBXsMb
         4GAXNgWVPpRD7ILdWNMb859r8A7YOwWBF2yhJfylszAfMw9OIrMrCy29uN7JLkjC+MVE
         C/Ho/cYUxlGTnTEWAgBdVuj8hYtHX28MkPRNObDfneJUDCgwMDY+SF+1k8xbx4dqjyhm
         j2hA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb//MUd3bdzII3FPppGlHifEW49MFIKQvy2VKhYNe8efrhk3ja24w2mBlStS/+pQVOwKeFWjE31ao4@vger.kernel.org
X-Gm-Message-State: AFuF++n+3WSA7JS7UFi/l9hjatcOt+hX75mlf1EdhbkOFsRMHSDgSPqQ
	4bruYwnrcJGz9Ibrp8Xkx7mkD03JwE4W4lWJ68MCWRyFTMikscuFtcSTEOD6uItN3qBI8j1IPdP
	94Xy5JDHiOy3/7YEbWFqT/Rp8TfqItvrsSrn+fJKqVV/FF3lSBXy4WA7WVnoBrp1w
X-Gm-Gg: AR+sD10mRTNkg+oYZTjxQMpPcMh6sP5soOkfZLEfpxfjfr6eSHPj20Iie+iGRzEp/Zn
	apKdUbamzd3/9xiXmk4ZAb4LwTsLw2EvaSQTgJFiyDvMf4Ci2bJ5bTqN3wtMtveLtorCSMxa+5g
	bNqcxvhhJx7NNEEmHreVTmiN1gbHwuwU/Xve11HSLXGa9sT+gYWTzbDFSBXJlmFBpbKzL4XIAig
	hhQkGued5GM9YCtctVHIdnU0D56irHu9ijO66Rn91biKE0+VZgWb1oc/1vnkbijMTzEGqkfNQAf
	G8MzQPI5l4gn+aDKXjR6FiIT9vAszb18v2ItQHfJ1l+GacohpkyPYXVIfZy4pfhrWAppuj4jvge
	TgL0NaFf9bHcXasVKhLIeeuXk
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr168245921cf.4.1787562886778;
        Mon, 24 Aug 2026 02:14:46 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr168245651cf.4.1787562886372;
        Mon, 24 Aug 2026 02:14:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296a46sm1295602866b.21.2026.08.24.02.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:14:45 -0700 (PDT)
Message-ID: <5ee26dfc-1924-47b2-87ba-ef15faa2d324@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:14:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q4mBvu3aZ3kVQyAGUDZYhsyvNbqo9UJf
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c0b87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IDAERHfcDOGiZqD5XsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX/G6RrluPYKR8
 fJflnSHkvPKkWi9+A2FnG2Ldqyv0grgxdlep4i7rRV1UIT2/ywCd7NobJrqq/PGbGkDMghmxEfH
 2AIDUeN++cu/e8Dz5+QkTUaCMmheQtolJvgISKxsD/7qoLU21C1Y9JQkxXxxo5eZKKLNEmjoMnt
 LqBYAJtMBJy9JOs+QCcAuY40Mq9uw1q30h7reEGpHo8kVRiqYIuUaHKQf4xTg1CI88cMoMFlGIW
 oMYVDkK55eO4v7JMXqGcR8N3nFqhXHhdI7MDepn0MX0SYm8g4cu/SBuzqFJxmjPo1Qf3jZo43DF
 KOKgWsLu022XEElomJMnyfQZf5A4QXAjpEtzlQ0bBVbkzZxQnQayws5XbUuGGhzUTY8L3NG7vP8
 UuUoClJaZU91Hy2eF1eWSDMlFCXosyvZ9prE45TwewJIF5isjUq5l0+OabxM9f3QJ6wpIsnDaD6
 +p0LLD8XyRfNw3+Ds2Q==
X-Proofpoint-GUID: q4mBvu3aZ3kVQyAGUDZYhsyvNbqo9UJf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7oL1qj+SDZPy
 PdgRQkUcurMM0LpzCEq2oUu9Dd0wW2bO6gp4FLQw1CekDi1cC3BZswrVbUZE8BV2QTQt1L3E1zU
 BROaQX5dDMCnSqam0EewEBvPgC0OlHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

On 8/11/26 11:36 PM, Elson Serrao wrote:
> EUD hardware can support multiple High-Speed USB paths, each routed
> through its own PHY. The active path is selected in hardware via the
> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
> the High-Speed PHY associated with the active path. To support this
> multi-path capability, the driver must manage PHY resources on a
> per-path basis, ensuring that the PHY for the currently selected
> path is properly initialized and powered.
> 
> This patch restructures the driver to implement per-path PHY management.
> The driver now powers the appropriate PHY based on the selected and
> enabled UTMI path, ensuring correct operation when EUD is enabled.
> 
> Historically, EUD appeared to work on single-path systems because the
> USB controller kept the PHY initialized. However, EUD is designed to
> operate independently of the USB controller and therefore requires
> explicit PHY control for proper operation.
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
