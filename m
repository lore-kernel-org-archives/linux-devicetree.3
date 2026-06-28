Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5C287268
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664159; cv=none; b=oacStnxLD82w5jyAcnPryV3anedyEf2XBqtYPYCQ6DRqgAMR/v18I9DpNYAY1e2afHCcjUnRlkRcNGNR/AfAr3TohtAhzukst7mdFwqUtnPU8HFpY0JEklNA5mfjB9UigcXtGVTVBO5u/IZxmEAUPrqZgkO5qRD9ZqQwpXRP2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664159; c=relaxed/simple;
	bh=4NSxC6Mn34yMci20ZTuvINbSgGpx57EckysY0lZLfXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgGkIw9aZAh+KVUlXjExvQxjIMir6BboKWbgj3GprJ0610soYy7OJqqYKLAp3PziLOXRYiR8K7qdu75G1Mv5UvaYdyfvxUxAsqDNyXqaMi74Hly7eMHvZG6Qzt+FXSBvJJyM4skcyJgaUSTBz8Qh8AJsMJyncHc8PV0P2kf+rGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP2KKzmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAdi97ra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oP2KKzmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAdi97ra"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESadx018374
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2xTfgdKMxe+
	lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=; b=oP2KKzmiFF01pM0QuyaGZPqYqH/
	QkOytiQj/Gi+4UWpXH+36Iafkf9AvMHUa9dck2aqGPoJSl5OGmoL9t7k+N6RhoFR
	wf1vkmaeXOhYKVo83oVuNo6HwA0c2lxwiab9NdH9AIuW+R6fchBGCoA3JgloxxEF
	8v16F2OhUf0ZigOQA+YubaT6K+I4poc4w9fy7igiwsbF+Rrm8Mmo3Ig7LU9UplSO
	QqI/yTEd6pHjI7VKmdt5nyRKY3J2AxJ5rF2QHxDpc9M3hZnyhvraBk2KGPt7NFgN
	sNAdVYP4vgD9OyWGexn/ZZKh/ZwWuGZjrIxD/FnnmqaxyMpLqpLqjJb4xWA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734b8kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:29:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-808a9e5182bso48882567b3.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782664157; x=1783268957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xTfgdKMxe+lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=;
        b=cAdi97raZUAITIX9UM2mv8AGN0Z6CG12bRoRUDSNRMhMCMSBmWvey2hYOy445LxhKV
         o6fv6qfyC0Orl3te+Tm3ObpKSttA0juh0dMXaZpaNbqgxwoPwOXiDSg49r11PslT53Jy
         9FlMlRNaXJwm1E98WjCqk1LFnxqD7wXXhokOX62oJ7BJAgfEs2/YfDQJLEgleo9bdV9/
         qNMZGwKbtVdjUI85qlojFq2Qg09TH/hajWQmAImPdUU6LDL8Pec12vNMeCObTfzTK7a3
         vjMDHxIQuQAE3/ZpIyS+2xTFKP34Cz2eRdtuJXJAP+DAnfwoGr2bl/UnVk2AYghim/Qb
         r9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664157; x=1783268957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xTfgdKMxe+lI5WKe3eni3EOigd5d95Lc7bPDZrpB20=;
        b=NPzr307doLS2HhS+Xjpjs0YCfV/GAqu5Mc2V1wQBCH4FCsqrGfXEs/dfsDLCXJxVSa
         3kbYr4F+V2B3+QxnDNTcXd78u4BneD/5i6zVVaRSZktTljkuL6a/pZq0zpLMb+UuQz6n
         UsNkzEv8cgPMd51gNaDv8H+3dPMm8+lWxQcGEtLYca2g0vCgNKYU7QsSJoosmjgJHyCt
         m/mVsvqjjJi02UTx9S6lYEEWUXL8JWt86oiQXJUydbEUEr88uQzBGch2GK0I94Hrslth
         tPX+2jhvYc9FdJRu1X1BrZfysxW960I+JrkRrJbI8glUda+wSCKA1b1cw3gsy7KpH263
         gDXA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1te4MD41CijDqum6sJTufAA4tEqMGJsPim4qt2SvmqK0+pGl4IhXB0/CM/7OqDeIwyNYag2IuHcHA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrqcz5S61Sk+uXRDcqRo8fL+57er31XK23ZjLo7PwKSRxXrgT4
	Nqtu3hPO7ctSGE4OtDXEelNN7NT00FHpzeyhGFHVfZTtAOf0Yl96aMf29ampkQX81ym9cQ/RcFz
	tO9XVeNemaAxOye3I/vhhExnX2/fdEHueqAoV5Le7DqbKtNI/7rQkFC4xRDDbKVmjD4XECjSW
X-Gm-Gg: AfdE7clmPQwvR9ulG0HlJaSVTB3ZlF4lICk/vMVieKvWjuNWzMZTHRyIe6Wj6+MKSWz
	AGgxTfx1K5ysnHu+fryL09B9ob24JMGA/vDEqzI9qwHh3kWw5bbeK4A9IH4nq+9k7yFfHADkz+i
	xQpOSzRYVtLuC8NzZZdlf8i13S3Y45jMYCshToqx6Iw93rsklSj3mBKmFkp2t16DClKtrnJu5fj
	Atss+C3GA874yREjnM/B3rSvLtN5wGgrIPNFYQ5NEtd0N5ujDyNMf1iv1zqv3pm9EcxWTLalai3
	LNcUoXA9tugeMs2qEnSuLyFoa2eQDqSp/C3mtanhUF8+l+SItSp9uIUJSY1gdCsKRmJfatb6bVe
	XNMf84kyDMh15arvOoR1sQyvXAMeKlWKHRsni18/aylrbAJf7xGh0S7CtVZIVH3bQE4E7byfSUT
	hoAdF4FHvfjg0X5YbBQXiFLoODUSHv8A==
X-Received: by 2002:a05:690c:7246:b0:80c:85e5:8753 with SMTP id 00721157ae682-80c85e58ad1mr79835737b3.60.1782664156920;
        Sun, 28 Jun 2026 09:29:16 -0700 (PDT)
X-Received: by 2002:a05:690c:7246:b0:80c:85e5:8753 with SMTP id 00721157ae682-80c85e58ad1mr79835587b3.60.1782664156328;
        Sun, 28 Jun 2026 09:29:16 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80ec6c724ffsm5417197b3.18.2026.06.28.09.29.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Jun 2026 09:29:15 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sun, 28 Jun 2026 09:29:13 -0700
Message-ID: <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com> <20260627190612.27271-1-jason.pettit@oss.qualcomm.com> <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L3CV_9Ij4uoyA0ydSeZUDFoocPAeIBwu
X-Proofpoint-ORIG-GUID: L3CV_9Ij4uoyA0ydSeZUDFoocPAeIBwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE0NyBTYWx0ZWRfX+W57T7gmOBW8
 AgQqN8NWrmJCwJ3Aika2tHiTQUxnAisZzjBw0/6/CgeWE8ipjV+2IVQkt9QK+JtpFek4yIqEJWf
 g8n7zGvgyiBFiPZ++Zq1YFuET1QG21o=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a414bdd cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=njTJukhxh3FpIjYFatEA:9
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE0NyBTYWx0ZWRfX9OYObOjZlMqP
 3TA8xl9dz9rf8J5O9GK1NN6ri9rN53Z5zx8x3OjLgvIkBVSXU3jk33ywv8XNr4QGGCRRpFoUiHC
 oIWorFaEgvD6yFv6k6R5iiFIgnobYmQtOJxe7pvUEIT8nXGYBur5PrNHruUKWPuRfadGv7Xi5cT
 /h6XTYaWPZNBMqdwFAeqacW4ztR0Q4PpXftHoUVK+Q+PrwG2PF9Fw0CTZ0vGB/qPlJs4j3ybcAi
 iCD5lm0XDbOCRrwFRh+HPzpRB/6Bn9jPs6gsGqi0u9SH3mn6S19du9Yv/ZR8P8o2vHEIM6vpIxF
 TOXJwFh2YBiREl3m/AcAkCiaSdHjLOBkecvz3zPdOlmePGxfDGTSgXQ02GQq7qcsZSt5vOwss7u
 XB1RfTcE34g5FWI6ExkOrJTEgk/R9qOP2AmVFPQO/mBwoM4R2GuwNHmhAXAP0ccM2jJ6DZ/HFqh
 BgYlSEz1vUhLFSQSh7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280147

On Sun, 28 Jun 2026 16:02:24 +0300, Dmitry Baryshkov wrote:
> This is very surprising. Can you check, is it actually the DWC3 or is it
> some power supply that is being toggled by the USB controller? In the
> former case it would mean that we miss some bits of PHY programming and
> still depend on the USB host / USB part of the PHY.

I tried to check this. I am fairly new to this, so I mostly poked at it on
the hardware. Here is what I did and what I saw, and you can probably read
more into it than I can.

1. First, with &usb_2 (the dwc3, HS-only) and &usb_2_hsphy enabled, HDMI
   works. I looked at the power state on that boot to see if the dwc3 turns
   on anything the DP side might also need. As far as I can tell they are
   separate. The combo PHY, the dwc3, and the DP controller are each in a
   different power domain, and the PHY's regulators show up under the PHY,
   not the dwc3:

     gcc_usb_2_phy_gdsc    on
         88e1000.phy                       active   (the combo PHY)
     gcc_usb30_tert_gdsc   on
         a000000.usb                       active   (the dwc3)
     mmcx                  on
         af64000.displayport-controller    active   (mdss_dp2)

     vreg_l2f_e0_0p94 -> 88e1000.phy-refgen
     vreg_l3f_e0_0p91 -> 88e1000.phy-vdda-pll
     vreg_l4h_e0_1p2  -> 88e1000.phy-vdda-phy

   So I did not find a rail or GDSC that the dwc3 owns and the PHY needs.

2. Then I removed &usb_2 and &usb_2_hsphy, rebuilt, and rebooted. mdss_dp2
   still binds:

     msm_dpu ae01000.display-controller: bound af64000.displayport-controller

   and HDMI-A-1 still reads connected, so the PHY seems powered and the AUX
   side is working, but there is no picture on the monitor.

3. Putting the two nodes back makes the picture come back, and the PHY's
   supplies look the same either way.

So from what I can see the power is not the thing being toggled. The PHY
stays powered without the dwc3, but DP still has no image. That seems to
line up with your first option, that something on the USB side of the PHY
still has to be brought up.

For now I have kept the dwc3 enabled as a workaround. If this is a driver
issue and someone has a fix or a pointer, I am happy to test it on the
hardware.

Thanks,
Jason
