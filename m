Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6055E3D0924
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600277; cv=none; b=SQ7/eUDMeaWgDR4mUwTKoLAE/AbGaSfNX/sHN1jj8a68W387LyZSN1EfbO8jsS9/fpCbzmSWXf/cWiCN5+6fYLvCNkpN6rPt18TNqw+itMNoBfyE9Czwd6NR0eTvn2mbrVedjlehTZjkVCXyO/jcRR2YG4ZdwrohP40gnD7EbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600277; c=relaxed/simple;
	bh=YBBoXpSOqThsnriHmo35Flk981yZhZCtpZaIWCWaQmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HUL7FEf4FuCPBTB6KG3RDH0s7qOOnM2aHU7vPy7qme4Nc6pQiQYzoimMZWwKEGnvDzIgSgDWUd5kVuwudRv/1P3kZN+f/H0OGcxcz3gqoEh9k2E0ILgINwP/hgrqACbbDK08Mx61YLiwe1bbVYg7x9oCGdiozz8Ynsu5YRbumXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWF6ooDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E29L9D5C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWF6ooDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E29L9D5C"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6veGc2378982
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DhKgSU/RvXU
	TJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=; b=WWF6ooDFq3S9VAXyGOMnGd/svZ0
	JqMR4SwUtcZiCITnZ+dJ7uOZjQ+sgkhvVCzaEFtvrL4C2wuMLD6wrchmvea2nGEt
	8r2Y5P5Oj30OsmsY9byHFbhVhZsvje6J2LFeRzkFFywnVE6xWBQwxDO2nLxlEdfs
	haBsFqAZMIJnWMAvB9or2qQ1l3nUvdAn3d0KvttRjjh29G1Iv4hA9avQTTICMRod
	mMIFnZO7c+ayE5p2YN3sEPHMmizsDlUbYDzW2oini4dvgtW9KBgfjrjeaD8FiIgd
	Kbizd6C+Jfok2tAeIaBdnyOHIOTPtJoE7EWBo7U2lTlotXPB5Fo67qjp9Vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx109j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so2770921a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600274; x=1775205074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=E29L9D5CYk30OU+99ZFpROMtQFrkvX/CHLyJ0cXyAOJbW+Hl9vmjGz0oJoF1UWxywX
         Gr6K7whkr+rQw5L4EsfoieXB/DN1V14o5Z8+I1ium+IKqi3MUpgPHU/8dcXAKb5CfCnj
         R3AmwKbh4t3YcJo4S49QqPcB4soQjcQdqTwKj9+vXsUEVPXa6NZbDtsGjSYRFVb5S6vL
         OmH8xdL5Gy0l9cpMjP3zwieBI+goWUWJWlPg3htQYLZNJ0nN4fEn70xRDsFKD4QPFXgg
         g5IyNoGAEp+nytqyXunRwveOAi+VkruzKTSs18iHTkPaXXSMtMC0aTiGFu39Dmf2wXr4
         0Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600274; x=1775205074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=XDO0bgZSdrl3HK/hyF0o84E3ZKzRW73RwdqUo8upeTkNJaliOcyulmL0pNRWVp+Bpb
         Iwi/d8hNRfPYgF2RHmGIIIbhYfb8pvd5E1yc1MRYr+++s/Ioa6gkJMllZYEabinDSzit
         6nZT8siuHtKFt1O1KzOsUBklG/Dz4RkGVdp03x7eThRFAV+b71TErIjIN1wG+UNqWkWu
         oJ2ImpeaxkctaJZVdm+5Bn1B7rnbSaLe4vsvLXhErddxUOr9u2zTG8qtjyV7FUtofwzb
         GTDNNJaMTKxYeyXeQvWVN5CDBper734kGNLLbUVAAn6aZxbm0MPGe4et++zmWoTRFa0u
         gbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVhKHswmRlZm8Pr9ArjtwjRa54X2pNtdGgSVOwD2E5lvPM+Ceky/qg/z7BGbDZQf9gpvUbKPJX16kO@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzvxRlcMBBxwPZ4zoHuhxdia4CFFBLDN7jveEBaFIh/eNCSfe
	bih8l5abMrrCgbY2DYAzWTs3mXdjgzd7GZC50D3tyjYCBRktdAo8ZU2rjrhOGrAGtDLvyYHM8ew
	sGpg6lSNDjFyP8f8lc98KDzZhPf0u7qMDT4z6T6NB3sneI7eM2iKeUcd0Tgr+SDwW
X-Gm-Gg: ATEYQzz1n4g7mJG4gyABJwFFxCy5BvgzMuHBg6tFBeG71lSELglBo8DG8D5OUvgQ11H
	Wh6PAvjY6Cr1N9W3cpR3rcevzsg1OsAdAvkc6/PouaIA7THVPZ1TfUHZWXo83AO655sulbDjy5g
	4kg4OykUhowcDVV156nQZPHaRq1eeXa/9YqZ6587hssjvChuzblv6zDkeWnUGX4Hv2/vy5zX19Z
	UcCTu3CAOtFk0LKGvheZKJot9Y7DFIDwRKHoU3Kata5Yi3kGN4ZhMkljMWxya6NU/cFvG6Wq8W0
	yyQk3hnxA7pA7x9iad/jI3Qg1BgD4cWrQnKLs3vBpJ5uKvizRtZDvv7dNM1iBObEFATIK/hKIZU
	kz3v7RdiLrPP3U2X4E8kuF+9D+wzBdzTCAuKAKB4O+aH7Fh1EufG6dDwY2vA=
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792664a91.30.1774600274356;
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792635a91.30.1774600273898;
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:00 +0800
Message-Id: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c64053 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=o9fUvUwYGSpSYbbeJqQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ejnVJxNeZlXHSbRE3A_8NOnfWt5z7ZOY
X-Proofpoint-ORIG-GUID: ejnVJxNeZlXHSbRE3A_8NOnfWt5z7ZOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX+i1AQOSMg92E
 6qXpUS6DQfEhWAOmG+L0yXP8vBB3Ua4PvGEYVEHAYwDlbJ8fm+JyYdNWLFM69FmOf/FOX/wsX6w
 TWNdEapMTCDhGuFqY6AUCvMVDKALOZMfCQMahvRQu2qL9ksTeKEsRJVinZ+d4w15U4x/LUzF4Bx
 FMXPs4F3iuk/AbbVcikG8DN3M2ojPJBh6Q0V5ci1ScHLxL00VuUN6hOvRx7+swAH6LhNY7vtc9Q
 74FuHpuFzh7QHNR+0f4hgfzfTKYxdW85Gqb2f4bE4OCmPpyitGZZ5h1B6mrfss2a6xqG16Fxwrl
 zQ6Q+CU0HxzmJITPNq/0PwQGX45Ke+aiCeMihw3qaIUhy1uyEmu+tX7MELNSX8hIiugWqMOk3cI
 w/etHR7Dsbn2YMW8WQuy+BJJADGddn3myDlheyIYJBh4N/GJEpaho+tffdT7FLRwZhwgk+lPQIE
 oDRjErqPqfp1VcpUsBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062

The lemans-evk mezzanine connector supports a robot expansion board that
requires UART0, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART0 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..1e9386677bf5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial2 = &uart0;
 	};
 
 	dmic: audio-codec-0 {
@@ -870,6 +871,10 @@ usb_id: usb-id-state {
 	};
 };
 
+&uart0 {
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;
-- 
2.34.1

