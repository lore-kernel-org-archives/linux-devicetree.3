Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B035B654
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579004; cv=none; b=Q+7CQW/g6V36S4ha8DBXa9UkdEgzKslBWHg+BrFB5F6oZV3Yi54yCzmzoCaPVO5SXMNzx6WXSLp8XJ7ZpJ3WqRwhPfDOwpaJj4gyCpOLDweld3CZdZeXmgFM2mmBi3EnFaSfXaCaaqi35FiIZI29K4XoWTfBLxVUrCJdJhoPaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579004; c=relaxed/simple;
	bh=NAN1d7tO2dIhLg5S/FLyH/p5tRrqiSHvGFXcTWtJID4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqIZD57UvsXiFRua9+2DJ0hzn0tDOpvxOFsRLnmloD678TkyZavZJPOKw/3ldvAfgmNv568Ck0EqCGcvazWeP02cps4QWTWBvaXHh3BpZqRhZVeVpM5pIndr33sD65te8oX8wDFTZrvM5zP0o98oXZrT9UTHBEV8KH1umDI8Ly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmIRBNZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z742gz2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmIRBNZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z742gz2N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G20G291801096
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Y/4e6Nhij4
	BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=; b=MmIRBNZR/fV2CbWHPSDPVboiD3E
	XeYSNqWwLRxHSU8HyYq2SoClLRAAleZaU0Bsj9eAFNwALrlCQfLwSdCleQsA+DKe
	RY5LZS9VQOEvBeRUnkJgwmZ3EWyULddGXvXTXBuQYXrnB5vFKWPdWGVx8JIYN8ZH
	tFsoaHyQM6r8C1i/YRfsaQp341W9rr/zY7yPAxa2ay9CkElj72k0KtC+T/xqpjvG
	XluleBsvWkfjA7OhtNgqsvcD9S00mAYS2+AGX+h/Tkwd+X6KSR7HASWBfF269RPt
	3XIIdnhHMs/A97luW8YKcyfnL8Fqg5V+GjSuTrkjfdW9I1ddBgqRjfdThYw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa74bjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:03:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f3041088so222503c88.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781578827; x=1782183627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y/4e6Nhij4BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=;
        b=Z742gz2Nyk8eYRTKBTLALr1qMhc8VbfKL5k9byhxsQOEeHL9+FOJE6+f+P/3B4fkU2
         2HZIFYYEpfjMD3TBxtPNZFKNk+VxTfq6ISuksSArfWCaT9u6k2YgcFoVhRySIQPCzWim
         qibgIJzxrI9HdSUbdta2jX8/BINJQkHLga3BhtI9F35BmJNGtQlR5TQBACK5Tsh9jD03
         o4L5J3qSslhKT+Ltw9qE4hYHxaPGZdxcdU+1mEjFQTb1POaGyp9cxf027zhRPKloXE5B
         4iOQBL7Lwk/wNhvZRt4moe5FTmYaw831UkK2B9zHDXro5IZZyZ/0qG1BaBAt2l7MqBzL
         OLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781578827; x=1782183627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Y/4e6Nhij4BXRQLAIgvXZ1lo9BXoQZRcdA1/kO02rQ=;
        b=rEFb7Am2Ovl6nH8oM45XU5tX1E3zY8SZZNQdu1pGz2ux8PdP5tav9N0IFha894+9x3
         gym6aS27AQwj+kqzsW3vK7Vv1m5mhznI9Vh0qeziroogY2BD955K3bAlPfDU7ACdMr8C
         mhIu9bUEA9JqXSxuM2YVIM0S06BUBaPPTT3RvsnFMZHp+sawaojMbJr27To48z5r6ZVC
         fVPqVTPHNWvGFQTUV5NgmBcwq8CA6minO21AYJwuezT60yloDbHekVDPDQARhia8WPyp
         4hG5hNL4nD5ahshUt8cifY0ekHSynVhfWdptIWHftgbZID2XdB3D/1L6dPlAV3B5+Rkd
         jxjw==
X-Forwarded-Encrypted: i=1; AFNElJ+pefOjakd5zc5IRxT4Gra2nhH2bLT6JkI63lBjJ/of7W0Rg9rOvBFeH6NWVcRP/IL3PYpea75CA0v4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8R8Df3A2BEj6BEPZBo/V3W9mCgYi6cSUfrhI8g62/pC0N+BpY
	3IAp6jvUyqzXh3pRZdiibr9ZWa0clnpRcIIlbGRYrVQ2IrHGKbldm/YCkQiiuZGGrPTW9bxqFZU
	9V7jqdIXVuIsBVXqsCQt3uAmnhkwjRU43me5xWIwelMRAEeV1dZA684AR/XRnnvRj
X-Gm-Gg: Acq92OEMezfKAPN6G43agafS7bl3vFvN0A+POq4wxAHcQJ6EYplDRDi6WOBMW+uLUJn
	Ug1BXxTeyJQ74iJEjOcpiFlepaaQxAVi96yiVTio63hW5o0LcduwXvEJadexY+QKU1/ewJ3h8fH
	UyihrRNIwp3kQzwSa6s53lSOJBnmnrKMvYAW3enwP51+x7d/RZ7SMc3S2BrM+aspwCHMYjoehrR
	+Qhex8mwohiSOlFbiSMu6vmwVr7eF6arRm+ST0Pkr3suW1nDqHd8ItC2k1T1e042W077apzqUb3
	Zpit3LI4qQU4ixEX+PalwA9buT0TGO0luOXtsfRdtFWA/m02F/oRZU8X9fLrYmpv/k5cc0/pCcR
	MW5RCKgQRmhmLs7gNvcedrInlxECY8g11q8XBoNRKLG4qSk+M0UiJ6YApIoSxUPGTwNG/+B0c
X-Received: by 2002:a05:7301:100d:b0:304:c73b:79ea with SMTP id 5a478bee46e88-3082008a304mr4529561eec.3.1781578826596;
        Mon, 15 Jun 2026 20:00:26 -0700 (PDT)
X-Received: by 2002:a05:7301:100d:b0:304:c73b:79ea with SMTP id 5a478bee46e88-3082008a304mr4529541eec.3.1781578826039;
        Mon, 15 Jun 2026 20:00:26 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91fb97sm18043030eec.14.2026.06.15.20.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 20:00:25 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, bartosz.golaszewski@linaro.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Tue, 16 Jun 2026 08:30:20 +0530
Message-Id: <20260616030020.3699706-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
References: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GyspmO3cHLQsqAUVinSrkWIBgImi1MYd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyNyBTYWx0ZWRfX/Jx45b3KjT0Y
 +TuAHkxRYzmGtx1Lkd5HMpe15/As+7n9PP++tb25FCOCZOexWc2i1cvQWVXTvVu72c5JHrS/eTH
 T52vn0KYLYmUMMGy1SaRyIbppO2h0A8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyNyBTYWx0ZWRfX78oX1DBsiyzH
 hkXMXXVbKXdujoDoeM8uVYd08d3/lZTUrrtT09KIVdKxMWC5CrvJnTcVJE62F7qxgPT4j8O2mrE
 NR+E0wGAup6xIXLM9lwLEXBLK5tH+pLtogSUBMlduU4m08KhJBYDVY9nLBR/VFKBHpGJONv6im4
 SVMLWdfVuDObc4Jf6wLrMrXSuwMiBtyHCi/eppP1QKG3T6xnEQDM/DA9KMbRqkyVt4AuYplpNbC
 +R9IVZzPFbP3r0KOzLvIILpHFGpT/LxO54c7lOLFtXgv48FL1P7JCJMebXI4wPYVN4qHACsyDGh
 +V7Zze7xjBQw5+hrfBUw3W/GK3l8/t9jcdka1+9Z/bkAC4ULU+DG3gEMq6m2RQPV4+f0ZvwX5cW
 kjljwI8YmsSAhiFGfnbP0OnXkaO26E2JdJW0SJvEAjGg2atQ7BAdbxh7FcDgjT+N7JpTwIUGkIP
 PiwiZ24SSZmhqnQZdAw==
X-Proofpoint-GUID: GyspmO3cHLQsqAUVinSrkWIBgImi1MYd
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a30bcf9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Hb1RCdnMn6tQr2U0v4cA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160027

Hi Dmitry,

On Tue, Jun 16, 2026 at 03:28:11AM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 04:02:28PM +0530, Wei Deng wrote:
>> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
>> wireless connectivity cards over PCIe and UART interfaces. Hence,
>> describe the connector node and link it with the PCIe 0 Root Port and
>> UART17 nodes through graph port/endpoint.
>>
>> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
>> lemans.dtsi to allow the PCI subsystem to associate the DT node with
>> the PCI-to-PCI bridge device.
>>
>> The M.2 Key E connector is powered by a 3.3V fixed regulator
>> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
>> (vreg_dcin_12v). Both regulators are always-on and are required by the
>> pcie-m2-e-connector binding.
>>
>> Also add the serial1 = &uart17 alias, which is required for the
>> Bluetooth serdev device to be enumerated on the UART17 interface.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Changes in v2:
>> - Collected Reviewed-by tag and reorganized the patch
>
> Please don't send the patches as replies to the previous iterations.
> Each new revision should be in a separate thread.

Thanks for the feedback. I will make sure to start a new thread for
each new revision going forward.

>>
>> Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]
>>
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
>>  2 files changed, 76 insertions(+)
>>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry

--
Best Regards,
Wei Deng
