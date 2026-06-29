Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693EB3ED3AF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720945; cv=pass; b=nswdtcTTuV8t1HQ1VDRAdDz9+oLrE3l2topdej0fbD5asX+cW2x/XIEle87RpGBOUcYRJ5f2fKpzTa4Wg1NlsLklofosqD1gJ0N7zcnHJLmGnITwylf2ixDra7GTebUNR/SATOMtGMi+9jKbuTHg8AWcnPwU1CqhhUKNoVmEjUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720945; c=relaxed/simple;
	bh=IsX4KejISX6gMC5OKUDBMLLuuM6n32TVilbbnMnqYiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrOEU9MieWUSkRQlDBZqyWhQ7Zrobx84N0dTUh49UnWYw6fB7tY3Bk9kASzjJlpFbDtQRElryC+mjVMHJ1V9rTK+dkX4wMh/kK0Xq8RPQx/UBaSt2KXYtkZcdNYnUxH2ZahxunOR8gqSVOCCdAgxRYACgmpINQueYGPc2ndr6L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVVh8lGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAjaeN2L; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVVh8lGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAjaeN2L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rHdi2101534
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n3dfw4QfyyM/PD42nYIn+HTs
	t0pRAT1v/rTCA1w30BY=; b=CVVh8lGpamatYpSe9D+/Tw5vNf0ftBJXlXH5FwCK
	CA2PZtp89fv9MUC5qOJmjoVmNZU6Q2TFA9UI7l04Go1tvhIUFDfy2YCRITw02YNW
	6zZ0xCK8xBDFFTYVrI0QsYhJZxJn02tycXNZXBM6vky6FqVHG/HW10OuKLKcwsax
	h0u5hKzESmXUxEYXU18pAS68jLTBZU16WWPv4IsGEN2YkZic7NttyX9op/AB7jce
	FAsruHH7CfnHESNBaUE/H7azSQ9oibavcBHmIPTFq2YVPYXnBjEyXU5EWTTSvntY
	kq+WECefGMvIA6XZ9ISPa6xkK8Y6+4vvPQcn9xkQdAr4VQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cnb4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:15:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso789742a12.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782720936; cv=none;
        d=google.com; s=arc-20260327;
        b=cyqP8Idl+b8c3PsD6S2cTQeg0BB5ed6VzAuB1UBG/sHYyrqYrYo+f6FEVMARN8W4YA
         YvPxoYpgXNhGFCmw2s6chDjhxhag+4rnzPAD9kAfI9nWatf1g7+tvaT/IQSjpO6F/GMs
         9bTqYats++P7XRyreOAv82VmBXub0naDu520i1fofZeM+/lsAJfds69SUOoraFaSYidg
         qbcXlMXbG4zR+GnyP54JwN+m97r8bg5tZ66Q+8NjSgCio2vY6aL34jFqhgpZWRFOZ/WM
         18GOhWrrLSdCVW3WSSmWQ7/uovJ+8gX2OgL2wRTU98pfVJCdGYJBWxm4ea1BsDN7cQPC
         wHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        fh=GNTTDqR7EyLMZ7G/Fpkl1toQ0KD7RAs6peZhvZyEzvM=;
        b=XvWd4e8Ad8WGdaLd5CAOFsd2VlIonuCA1TzbNcMn5Whdtrtwh2DLfdE3FMjkxtBETB
         4nTYDFzAHjtr+uVlNy+nwcyVpJuk9EFlMWg2rnhpNkw5w1At9cTusyPgZDh64j2pbJrg
         zepyvMrNfZnIw2XJP8o+0LVsMUQlkxsssdVpqvfPaCGko/FpslD7HYs+gR4t60eqbWQI
         kv8MvZwdo43GYdLQAIYEhH5/Wvz9fFyHHKnmZIJRtW7lM8t4yLMkPyeQDC4J/E1eK1Ks
         2chZPmEZfN/KyiakgBSYQUEqjtbRc9YDKSSvmAVRnbQLF1wgAt3Sr9mOHfEkSI3lQlcO
         x7qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782720936; x=1783325736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        b=eAjaeN2Lo8hxNu9whdVjcUne/AnnKWpwGK2Rqh31VapYi7FgqAuY+WE/KtMWWhRPV/
         FFkN/2B2R7Ps3dTQGadwU9W/eAQHHlTKZlzohYvLZNc5YD+NtAh/P3Z8s0qoIPwzPiu1
         Apf7kYTm5o8MlzVObs8V0O7fbPRKP5nUmn0IyFcZ6eFjaFhRDVVznEE5hFgPPqFmh39n
         U4zujmLskubxDZqzuQaA3Cyfs6MN9759WJDIlzE59WgetW3qBjvviNyK5xyWYnhP1KCq
         f/HSuwgna9Wo/kGAPfhqhjt3XNvPHHFXAq70f+rTxXP/ArC3gNZ+FZGikO/jTV49D37u
         u0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782720936; x=1783325736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        b=dJJRswbpULVPzkIlVxsmK1d4gKuBkV3nzcqLnBTuPZB1pwEzw6nDz6v5BFlt9bZ/fg
         9p4dt38kUHGDMeWTWpAMy1pCeTSHVKM0fOGu6JxeX0R3cPsbMRCnNl32nqRoMGlBAwid
         aYq8evKGM1HXvirJbhISWQlmXDB2UMVOFHykZNWSlb5kZ3/5FbTKM72C5leg6sOaZTtp
         uF/AsQO3UIeVmCG7AiDuKDzgYJLuAa3Xk6GA8K85HL5/K0daN5z2ObFj578JqOk3t6ZM
         d1qOtdkOLEEA9zMql/I0Ym8UAMQL28Pgqt7kI6oS3CuN8avDverp4TCMWlyxmPEXhJ9f
         ApNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lFkd9BDqSLrAkoNc8cYaP3Bkt+I5LaH8ZAofVbYzNTjhXlUOSoJ7pe8tlEPwLT487eeZ5X8CuwIt9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHqWA/lmjZ89Pk/TS53wwThUTNEoAzUhMWJIbFGsKme1pdPkZ
	XQFLaeuDs1q0i4XsS7UWOgjV/jR/3F7klauwaWnErhs3Jnc+8aUMo+pG1z4RjZjQ8P65Sgfkl7O
	D8QCeSrxvPDmqRsT0VwJdGMJER2jeIavVV/MCqP5vDxcdRXsoryCWLNUJlHYzyULycQMku/TWZl
	3EXezV19fWkMUId+aBM2l0MAz3vP8H73kdL7GjajI=
X-Gm-Gg: AfdE7cmKXNnz06fjV4fnmvOg0Lk23oMXFu1IdGyY8rZ2OBH+VuXiouo/lpmrv8gQATh
	eBO+BTiDRpB+j4a4CtJn1o5CpAtVDBGYg7UZDHDLRzZQiA9bkNf1eRNnrDu65gHBIM9I31rJH1z
	7h5Z8cmPKzZX8iABz+uxLzhY7cTiuzq/acA2uFAyuz/mS1KeRHBqBxhugZe2o/162/ar9BocsZb
	S/8AroDIMbkzMIXnSDZQ9BfktbGWA==
X-Received: by 2002:a05:6a20:c91c:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3bd4acad1fcmr16350281637.18.1782720935881;
        Mon, 29 Jun 2026 01:15:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:c91c:b0:3b4:8300:7019 with SMTP id
 adf61e73a8af0-3bd4acad1fcmr16350251637.18.1782720935383; Mon, 29 Jun 2026
 01:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n> <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
In-Reply-To: <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:15:23 +0300
X-Gm-Features: AVVi8Ce7b0Su9AgAkUGCUSmYUqNZmOrMX94ZjtjracC8pYWTaq4eMVHPsh68k7E
Message-ID: <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a4229a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MSO-Kgdoh17wuRcxXK4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NCBTYWx0ZWRfX26OdASqlyEce
 oLaEnBtFud2qEco6T4fpxwMnQH78EQRpuJeQpoHipUkKwxwVSkRx9pIoG8n27ogEUuZsLQ3lCNV
 rUjlwPPaAqKaVsmV5utEJ8+wXuFuzrE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NCBTYWx0ZWRfX+Soc4X1uEY3J
 dkczjkDTsMFufzM8dstu9rwZiZgYFXSi0CxGkloGRrQxK1i9wbgtj2Ct6xKR75PKBLvrQUCnKmw
 Q/h7zBwUoW/j6dt9m2/tptrIsbRfmLgp/gvPo6oZhjj4t2qujBnYPYDNESY6o3L+HnLPdSkCCdt
 5+c/9sCn8XVu7xSZNZYLcc6lXTGWM8e0J7QkFK9s4CiZjX79NUVwJhlHmnWEEmQk0gK575TKP76
 65kwunNRCKDU16udQpLAjqL4XVTdcD4CCYxQAhrte5YE2OBhjJhSTBciHj6Oz47qVew+5PqYBgn
 EgZ3JVdGuGWiOWd1GGeyUj36KfxiDPcnIeGVJNPu93I1EcMj7BvUQtjM0+oHubYBtdBMdTsy1q2
 51zV0XxAm40BXF+sOirpIMeswaEwg7Mvlx/AURJ35c18Tm/E2nUPyH9B1pNHeSOm1Rn36jbjN+F
 DDCnrSpYzL/j1cZCuoQ==
X-Proofpoint-GUID: u6UnY-YfpLE4Y7TEvvJzK0ValDqzLd9-
X-Proofpoint-ORIG-GUID: u6UnY-YfpLE4Y7TEvvJzK0ValDqzLd9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290064

On Mon, 29 Jun 2026 at 10:22, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> The patches were developed by different team members based on their respective platforms. I have consolidated the patches across all platforms (CQM, CQS, and IQS) and shared them as a single bundle to facilitate easier review for the maintainers.

You didn't answer the question though. 'What is missing?'. You didn't
add the Signed-off-by. Does it state that you don't know if you can
distribute the patch?

See https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>
> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>
> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node.
> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>
> Oh, and I nearly forgot. You are resending a patch written by somebody
> else. What is missing here and why?
>


-- 
With best wishes
Dmitry
