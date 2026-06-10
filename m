Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543C03DDDA7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096254; cv=pass; b=WUv4L6nnrpmzIPnCPzBGx0xskPCN8Mb8ip5sVj5QNnZwxkNjd8UVsQgJosicjC0z4NTekxWL/o7ITk6Gu9rOSe8KqRzVd1thkY3IPnB255wyWbeYzhqf0SsQJt+ATiFGIHIAzgzS/H4a30A1po0D/a/z419TkFLjqllasl61JIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096254; c=relaxed/simple;
	bh=tW2ug2qnrfWrWds0MaNm+T/zDf6l/TTye/3QEm2z5Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi/fM2WHsJUYSoWowPrSKRS6n2ZwGGkuXCqpHm5skmGn1DJEQZwGQAXbeetQ6E44ssQA09DDGXenYY/VVOCUDC42DhD9OeyQUxJYSCpr507Xj7htuw+djgPwmOCXWMHnho9m0mkKE3MVgsfezZrxLu2O9k2vD2kATUPMd2mDjLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jo+LDpdc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6B6an7z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jo+LDpdc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6B6an7z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCHWM1472577
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=; b=Jo+LDpdc3hbtLP/N
	gjYv5nScv03nwS8ZuhcNwMT0zY+aZET5SzRVpQL7l7MoqMhMHenG9ieXKZv4hxon
	Qilk4FFoBMe0lEXgJ1qjJUC5jT9xGEE4PQ32yrnYcUYNIiwV9lMGnmSUV8wqBU9K
	CAfeRvmMHHP9umg9HGQjplO6wRoo3pJJ9BfCepz6OjMgKlBiYzDQ04de3OMcHsjV
	3He/wi4n1vGNl3RwHVjeWo5OjIW0zw5vIp2ytTr9DpuUXkEDDPoTlTsamCRlro8v
	MXQxj8xffuheHPN1Wmmtu3V4JToSbfz2PnMlmQQ5t/WLIqtO7vvJIbIYUhYWS6vt
	tmYDSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9wh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915767b341eso769747685a.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781096252; cv=none;
        d=google.com; s=arc-20240605;
        b=YHuOa0x3B4QaO8ptiZUzDZt+51pkL4zCQmWD/OcFQnWHUU+auMBcGKrmeWU5j2p82C
         YGHDFKXRqWKbO5uNPJR6NlYyJ7BrDHc4hZjpzICIhIJ3bZItW8w7KIRiyLj91foasrQD
         80UBT8CKFGwfyxRUiuyOwJUQ8YggKZYDXgnY1aG+1tjxH7/c1rKzdAqY2QRFjoOu0mcG
         YoDSd+mMbqIurkVPmy00UMuyPW52TgXAdpTgMGIecqCvWQkcFmM+NJrwIvcFFth4+VX5
         96/FEP84/OkDDCQSHmruOMnXwhLqTsKBNSW1OvqDd+OL3XVOuXDjIatjV/xsdUA3Ow8Z
         KJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        fh=QVThGSpkELKuMOx8e/HddMuhcejgiUrHu+fL9Rle4QA=;
        b=O8WpU/hiLKVGyJJzZYicjLrhuFp41X/Eb8wJY3imiwXbv+hrRMesdAx4isZcZRt/R7
         C2kDWPG1e8FYR1tvUxNGOfHA6MSxqw9koH12C3kkkB7nDPlykcsJIyQdSDJkPEjhECo6
         gowDb6N0EeXOnn90Sedweios6UakVsHu/zWUcNLTuUYg6WE2Anhf7FTu1x7gJZwD3xl6
         j3xnblYkIQUS5sGbKBGfX4KpahKOZUrY9Ap5nv22kgnlDb1X09ZP2PqC7JInBSn0Y21p
         HQyxBRYKxK5OoEF/sVqe90H0nBfOCoOsxwTxmkY4w7aNe8ctWnXWpQ+pCTCvJTBBwXrm
         ZkEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096252; x=1781701052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        b=j6B6an7zqZxGg014HhzqaQooIcLlkiXrrDn6S6CS+NqPkKWenhyOv6GBZyheRsNOv3
         FaTq2JNJ+Sv8g/lNGN87hmiDyqWh/lJe6LQqcOKr8rjDgQ91trV07LronCT8ablS6sHd
         t0YXPtbLaFjUQnKgGz4ZGvQ8wTllIaHPXKCFbe7KeK02WaMzQyhSLzV51trsGnWLUsKd
         FfIVCGYHFoYQFAw35MhTemJlHvsk/ol7O4/Sc0GtVxizKQewJ23jMlRZtGS8Avg23aie
         g7qPstBKYUpZHrDrtxJexABBCYyOEOIfd/zHg5oPIVVjTHpBqRyI3u6vwbZs0yWLICXP
         YSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096252; x=1781701052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        b=ZcTiuiy/T83OOO3droGWU663W8ePn7ovRc++4PVusiMTIJHoirRqa4i+RLx6wUULVT
         zzuMQCa9NOZ7dvsY95IHlTEfsQIAb5hFJZlE5DWiovX+7SH66IB5U9hmdsYRtLmyBooR
         tZAXEksANjNwU6LtbKC5/Ea4Up3IBXx+OH74MFq0320siGlvcZBsa4He2ss/jcIO/HKd
         V0+1i69dI/ujKLsx1dTHp/HE2Jwh5+a5UVuD2B0+Zjf2eOhJ8kjY9pvQgmj1XG2C2G5w
         Hl2ZQYT/AEl5DF9EchLJamjH8qY469y2alofswM0MmtpJrym172x/wJo7avrKl9wSD7T
         /ZYA==
X-Forwarded-Encrypted: i=1; AFNElJ+fEOQyeVM7NbS8/yarSEIOlr+rM4LodkLJ0n50y8AkFCiYSyNNS4OCGXAoLhZQK09jKzBCp1Hvwb9U@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPj3kW2a6KSctN+JmzC38XL2S8VO9xZcCTGNo/tZwMw/0+m2a
	zLxboiK7Qtb0C+ObhoD6odzCz4bMaVdm/RmdEolf3GmmCyoiTX3NpTSd7JpEplugaYhcCeW4Irs
	9ynGEgXz8rKZWIjWrx7qcsBKOkLEII5L3/EpOPVsRdNtOxpFlPbGks/kLjt2a+X+pqWiCbW/a8m
	Oowi9Qzc/ekLk6+3oj9TlwAxwIbtnmWCHVBFCed/w=
X-Gm-Gg: Acq92OGhSPlT0iWnvaW3ydvgoH3n+J/L9KyMRhdTltFTfMFlP10OIADFzmtLz6mL0uB
	V5+tbcapss1uoc1o8XSEYeYekR/fhzIBZSL30XlJIfsE2k9S+ZBweP2FqJzCawKEK/fiLSQs4GD
	yw11Lov6PDpdpNNIDYJR9stfdAZEYRLnvWOoa0DM6EEInO1gA8RpOhv08f+o1Am9Oel9nMm1qMP
	lR9M7HJT9kKsS9I+Wsnb8RZGmqhPkZW74t/mfLGeKbRmbO2ZaWmeFzf5tyZIeAOkztfmBD6jBFG
	RW/VOtBNV68aMZpWWz1yAJ53XqzqrFZvBigd3bsZyOfadvPs41sO9Fcrpl5T
X-Received: by 2002:a05:620a:2a05:b0:915:8f08:5fa7 with SMTP id af79cd13be357-915a9db4f9amr3985360685a.52.1781096251531;
        Wed, 10 Jun 2026 05:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:915:8f08:5fa7 with SMTP id
 af79cd13be357-915a9db4f9amr3985355585a.52.1781096251053; Wed, 10 Jun 2026
 05:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:57:19 +0200
X-Gm-Features: AVVi8CcxOKigLr6194Bhv_WTrw4ST8HeTkfkITNz3zuzkSQJ796DFO1Yr47kJiM
Message-ID: <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a295f3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GnT27IE6eeqZaXBg3uAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: r1yxa3wq40nlt8KZIurUV1kGEKmlD6ZQ
X-Proofpoint-ORIG-GUID: r1yxa3wq40nlt8KZIurUV1kGEKmlD6ZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX2YhYqR+t6Yu1
 HL8P3CloOr6QSslnoqoLH5IHEINzHpAOWfuxM6K4seCZMU9W3jE9vCeo3/YiEpsJJIQBzcOhYN2
 cxJczCtxHGS21h85xJdAJCDFlanTxBzg2FW4XuhbYotXQBfZjzGaDKGceGQPj4MUawLpyBOEwOM
 3fbwGQwkrTr65FGwZOGGqoDt4CwKg6ANuHEJAgni7vejpujyurl5DHI822aKJlv64wnrDLiKnuR
 0iml/KjvaePxE9NwrbBDH4jP/8lvqwaQBUiiGlmF4n4W7YUVcSJbh9wZ1JqNrKU7LrHER9mXQz5
 2ilayxzrGVk+J37hi3oabuiJMzVu3QWpYyAJXTscrWMVqAu7L4hheT0OA/YBn89GKs6rXJsITx9
 hIizpEE6l84SO2moHijQTewc2j50EOi0Sze6DWGM1tcFDlPxyqcmDUtzP4K7uU81uO9/QHY/mvs
 6bJhVqHO8BJ24i8mDLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123

Hi Anurag,

On Fri, May 29, 2026 at 4:29=E2=80=AFPM Anurag Pateriya
<anurag.pateriya@oss.qualcomm.com> wrote:
>
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> kaanapali based boards.

I would like to highlight that when Linux/EFI is enabled, which is a
common config, efi_reboot is used as the primary reboot path (see
machine_restart). As a result, the PSCI reboot hook is not invoked in
this scenario, assuming Qualcomm firmware provides EFI runtime
services. As a follow-up, it would therefore be beneficial to also
improve the EFI path to support such custom mode(s)...

Regards,
Loic



>
> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboot=
s-v22-0-28a5bde07483@oss.qualcomm.com/
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed subject lines.
> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-change=
s-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
>
> ---
> Anurag Pateriya (1):
>       arm64: dts: qcom: sm8750: add reboot-mode support
>
> Xin Liu (1):
>       arm64: dts: qcom: kaanapali: add reboot-mode support
>
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
>  6 files changed, 30 insertions(+), 2 deletions(-)
> ---
> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
>
> Best regards,
> --
> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>
>
