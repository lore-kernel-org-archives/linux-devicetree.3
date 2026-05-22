Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E033C553F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448232; cv=none; b=RjfyyVMGi66Bsp56mRK8CtjI8sYy9aL/TIAPztPhi1WmLHNi4FfED+KtCUdRrgC48bpVa0eb/e+0XefHVguqo/YTbAyZ9/qGkhlth0vq/zYWcGXtZ/eKvHRKtViAHgEHe6TV9B+YqLLvfIfAOTtxrONyjku+2HY10wM53l8S1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448232; c=relaxed/simple;
	bh=7QeD4D35Lu9FczIe/YORC2EtD3i3MlNmzMEyPcftMas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C/Z4pKMnxxbsle4ASVLdoULqTC4prkwPNogOGKDWUz17AYzmSxQd49P+6m01EG+5Sr1eJ3jypCg2zD6Qi4E43aA0IpiZDJoY4h8WSMWpiKgDIpL40CQ+0LhNqq4PhKvcl5KK5xI2M/uF5U2YuvbPrscS1FNtHkQzs4wOk80l+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxCOtAHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLg8aW4H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxCOtAHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLg8aW4H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UPbj1959859
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ZItP6YT8OFjPlREFpiOWN
	E6f39guF4GQvjFE+VYuDs=; b=PxCOtAHxcn9CTi649g1LBuwD0WJM5pcZrQzU6f
	kE5EwxlKQ+TBkeFvDhG0aYLWtkh16q7v95vgi8WOJZqVZamahB+UHop4cQc4F7rL
	jDYRPkP+M9Xe9bmbnklJ4X7HxfbStmQII672TH4j1v/ZhU4XBgejka2rS0nF429w
	lAMXBw7o1hwk7pdeA/xMYhZltFLv1S+/cp90BtkSkW+Iw4BKUNQD1CHebCTlNYAm
	cB41Cp7yQhC/NeUwlV8pmP4kmFtrj9/FjVGgvz5Gu07sdOYh3K80IDSMT9iFp7+1
	8EWdt+bUB1Esun+m3sfQNOd+8bBQ6zJvApOyY2GMBwHWVsYQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxes810-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso7870125b3a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448228; x=1780053028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZItP6YT8OFjPlREFpiOWNE6f39guF4GQvjFE+VYuDs=;
        b=dLg8aW4HF+mXiw5T1H3+RTCEAUuTVxMhnBC5hq06bn/XrWdL02PybDS8/xOWaMebYo
         gRExSnOBEaEsz8zqm/Wt1Rqa5tyVnrF9X7n7xY09D9s3/udWo5oBQZE5HYQZ7BuSMccQ
         VIxLJKkGhz5ku+cJO6bz1nFlmK/8+0gCJCJRNXWJSpkrIVG9t0tK9nQaH2Imkkfh3Bh2
         HLnlH9Vsw07FF8sxZGCDYYdht3SVqitUvX55MRJ0pNUf+ZhE5XpDJ8gww2uUGMxu7t8K
         iJ6ls1Il8/5/bFSkgwXGAiI3kGRQb/w7lGPGGYscJLReEfzj3RbmqU83eJe5aDKZYb/G
         b2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448228; x=1780053028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZItP6YT8OFjPlREFpiOWNE6f39guF4GQvjFE+VYuDs=;
        b=OnKXJniOtYgp+b2C+dnz77O37r7U7rYk1GsyKP9E/G+Atcf4Tpn0zy1+KZhokuVU+w
         Tt2xfl5gMa6uf8c2sQoIgVy+R/ijQlE2qaxJ8jruvJdD1t7r/jVr2Aax/r6j+eRCzp26
         LbvzTzEi5oxkN9vBviSpYa7w7nQXX0MvsR8zjid4OYkto9jCSYG+pNokvcDRArKb0SP9
         PftnnFToqNB5OEBgb1M/QP9giLIvL/IYbHoeHgdsbBtpuLf/mUsdX9rM74jf9ouH7P9V
         49E5UrrFoLie0kZqIN1kBQVI/qqTESUpn3RVwN+fgmIIaeANmm/Rb6It/AmkHcgAXEkG
         v8lQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QJw/C+eh5s8jnCSuPRmisA7BYZV8XUdJrLNugz+46cnMrnpStORVG9TlR/fc8/UqJNIUbrt89WE/a@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6UN6PODAqjbHwEpQ8ilfzA/n7u4nKXYu1dJfwyvTTu4zbxLC
	jC01PvzinWoTQXw7Ai/GyG1Hy+1pbWiCTfXQh9Vw3E5kOEIQSdz40llws2JD88+FgTf52nvQM+j
	7sH4jCRdNEkPlsI4xXfrk4hjDg+YWmT6IWmfURlh8uHKO9aifkwV/LuHJKadNwja9
X-Gm-Gg: Acq92OGmSHnRDmVcI2teJSjCowC0sPVSdh4z7w3OcSjX9fvgYi/gfdJyK6+JtFP5xki
	YchMw3M3pD55hVOFzMvzRsRJxw0MrKOn/idIiwHKwcVoY0GZKWxL46dKNmWYoigqiWVmyqPqaRf
	1DYDMIH+GhZiQ1Q1+n2PK/3gds7/G+a5bBQ/u+0qUmB5JmWAUMRfBS9I7/GtGy+l8+llzoN6C5Q
	qNDCIMkDvDmW/pFMUnbol0eVtKFqghdmeulRLQwTOFhiM0Y3l4CDgB1DECr3GR6IEyUFFwl1QZZ
	HquLZ6NojQ2kXtThVtPT7EmvR5zuOjZyoB2CAPK5uh5IeNXwk2sVSk+yaRzlq/lY4twTqf1Xf3l
	CBGGpCSEdxYm96D4Wn37ITX29IDBW9UC7T5h1h8tehfi1d1WDs4P9Dm08fqvb6Dwgi7wc
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr3321884b3a.11.1779448228591;
        Fri, 22 May 2026 04:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr3321853b3a.11.1779448228125;
        Fri, 22 May 2026 04:10:28 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1578962b3a.0.2026.05.22.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:10:27 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Subject: [PATCH 0/2] Remove gold/silver_cpu_sleep idle states for lemans
 and monaco
Date: Fri, 22 May 2026 16:40:12 +0530
Message-Id: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ5EGoC/yXM3wpAMBSA8VfRubaaCfEqkmY7OPKvDam1dzdc/
 i6+z4FFQ2ihihwYvMjStgYkcQRqlOuAjHQwCC5yngnBlrlV+0l6RqYlT4uizHKtOIRgN9jT/c3
 q5rc9uwnV8R7A+wcmOssnbgAAAA==
X-Change-ID: 20260522-ml_cpuidle-da0377956dc0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779448225; l=853;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=7QeD4D35Lu9FczIe/YORC2EtD3i3MlNmzMEyPcftMas=;
 b=Kd4tUcSXJ35UsF4NRDevQDcSuuW3FJSiNFkuyJyz1ljwtViJQGzPeIizRAdw31ErkEvnZkJPx
 8EuD+7SX6JPBC+FZBYK0PkSlHozD5RP+l3ipkHLNvO6ad43lni7Uicp
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX8+brI5PI3unF
 iEOrBUMyvOss9EiNiep8K04wNxkOv5gfmzH0Pn+ZcQ2A8bNAjOObaScjx+XVUj8lP79LXKn0i3D
 xq3kseWl/y2WSBrekTsfIQYX8tmIipDwLD7asdPZvrRnkirybUCsGoorbJ6kk1wEmYQDFa+2Rsz
 yKOUH/cRG7StAMdKwoTH1T5oWpK+xXdEBG7bmwnzveHkp395Yr0DJtieJPq/dfKKNHzzdiNT+2j
 vVFyyp3vYpBBAwDWJQHwqCqekHxp5RSrt3RUv9W8HThkFkPwiJpZKJFm/oIO33ak3yL3ydh4Xvg
 I+6gLwbGPe8jE5MzzeWxLmyI2i2aT1Ri1YOOBLj42cp05yzFynk+NZNh3lhWv/BLr4BCFLjKFp+
 OulJ8TAIvCxCqCg+vssCyQfLseXHEifz+w2CpOIczXxxv0VTcLqAmz4yVnZbDDMjdAUf70rSJgG
 C3nrggcNixKCkbPTggA==
X-Proofpoint-GUID: BWewK_4yNMa5aaQlXDbFGhmHfahX6KKy
X-Proofpoint-ORIG-GUID: BWewK_4yNMa5aaQlXDbFGhmHfahX6KKy
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a1039a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7Kxd-bO9P_s-EMYgHbYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220111

Firmware supports both CPU power collapse and CPU PLL/rail power collapse
idle states. However, CPU power collapse mode is often not utilized in 
favor of performance. Remove CPU power collapse modes for lemans and 
monaco as well aligning with SM8350/SM8450/SM8550/SM8650.

---
Navya Malempati (2):
      arm64: dts: qcom: monaco: Remove the little/big_cpu_sleep_0 idle states
      arm64: dts: qcom: lemans: Remove the gold_cpu_sleep idle state

 arch/arm64/boot/dts/qcom/lemans.dtsi | 36 +++++++++---------------------------
 arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
 2 files changed, 17 insertions(+), 55 deletions(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-ml_cpuidle-da0377956dc0

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

