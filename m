Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520335;
	b=enveeqgUGu8ARrZfKXMcXUKMcaZFcY7n7dqy7buVJmmnkvR7Lqn2b2U91O5KSZtQzPlK
	 QZOGpU0/H7vjNhM6WNI7SZrztP2OX5Vtq84f/gjtSakkZQaw5U1MIsVcvjqD8KQylADjv
	 5mpnQo3vlmFLQfLKPfNLCNhIAISJKTFEQ3G5MKy4QRIKU7aVV+FsQxMXZwk2jsEUMx7hd
	 g66xnweUOEH3jrefFTCwe3qcRHcdyf5xtaPn8C7Ey4L43HlIMuBPs6+GA18ylGVh+3Jqk
	 guIjOQy+RPEOOym8CDA58e9k3d3/+ZbSn9ct+wMFJJ68bZO770SBP1/Czjepbk78ndQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
	b=I0ahOuF2Wnnby+69MW+RdRwDMbIRcWCyK2evULpJlO+Q3GHtenkKe2/0Rc5E6GMIc76p
	 e6MvmQNPz72si/kyZFmnXJZIgSWFGHNp8Q08ep1Uehs9h1EeHqvMT1FUcslAk70Y4Vxf0
	 4BXgveRrWkQyr/QylcYvZUy5FnpoDW6YahKjkcqSLTomna0M4hTxRMNkPdzXrA5aJvdJu
	 5hoFEngTrVciH0LCgNhV0/DJ4+kh2dr5UYw3E6CnPMytlsPnN7I/ht8KN8TZGTnnriD0V
	 FCv091WBAHwlcPL3sBkzL/O82ZLczAV+O8RWcr9cIGEput0dXmzEuzfx/Lko0jExQXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C6606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KXQt4183564
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 08:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xz3k8nUkuCL
	1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=; b=pnDOAO2kXTl37RH6ahQbhjshAM2
	J7/6suSCthRNIhkM5dEWNMq2XNZQ21gmkr3AyJBdnmuaPcb/wMGE+XEjqrKDdYl8
	/23b65O4ndOjKtWHdpXL+nSQDLknB+HNwZWwDhYP39r6cMb+IGrxNGJHseHUmqFT
	I/UbiFUK1ee8CXi06SvVMOWBE2PPkLUEuX8N5FzhFQjE9Jc01MwH4Ru1UF8s4E3k
	1zUoA4DQgyDsoh/pzUP9a77t2FeRQLLP1gCCdQmgHRy7dDgwAWCN/Y9siJiCANDl
	eAvqiadKJezPF5EoxscMBh9pYb3zYOVdTVlH5R25Ttp3uVkmltNToHE6GOQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkkbfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 08:05:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so2835115eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520301; x=1794125101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=Z2SetOW5+S9IhAsCcLX8iXytIdnt9LFePB5/eSKYBrc2CLup++RqLUs8kKHJKS5mem
         IxCwyU87Gb5AdyFQeMDzvdYfdFCFKceIaybSExQgpn7dw6YfvYqqaSXwchYzdfbgxjb0
         anwWE/5N9q9mx3wUS6tm3Cvyzn+RpSZtW30Ph1XidGrUyXhtf9SdYKAMfx/h27Ih8VTC
         zFAq7dgGPsFfYC7JF9WHgBWWk6yrGmODERb4s6+jyae9m3APjTe5GXZngR1zBJd0casu
         KFaS8q1bE22DzKA0/DSsx543n7ak59iyAQ/J6exPybhjtox+LLLZOW44H6iEGgvWGAlR
         BIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520301; x=1794125101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=UWWPD75pEPQJziva5QRH1+cnSYKCsAG+Pqf7dg03X+Ytp4zxlKD4daOBUD/Crhluee
         0vDhvDDSVOFQpo3WlxdNGsl5g6WEvy1pVjsB94kwJmvexaLyeUn/VGivJy6zCqUzsuM7
         CSqmngP9pPV4SG5LhIyWTP/BpFWIS41UM/TW/jTBANQz0thfYBv/uDp1e0vVxaagTf+z
         EFCDcr3Jr+P/X5lIY2bYrZxdeUtSIjaHGI09WhXz6YZKxabDmgXVWGoRGQYzcEPn2+5W
         ISZb4MlD6iTAOsMruHeP0Cz5gfIopskS8MoX5ejw6e1nY7vDSpAKAOHf091sB7N8ArFG
         8dRA==
X-Forwarded-Encrypted: i=1; AKwUvByz9QI8twX+wVkCCIg39fD15zSk+2THVF08BHronxCs/Ltj2PzrkxwjwXzXtJulGw7xCnIWu863s8/1@vger.kernel.org
X-Gm-Message-State: APuU4Z8IJzEdIHVu/KXWey17BSwPJ0W5SRorJ9NM8HSszjORq+K7J+87
	98UMbBlKjehIHp80vW2N2f4fEcELZyhMc/2/Qoem+1xM8cGhppbO4+1LqXtykzvJvoshAeopEBj
	V4aUfJNUKFs7/P4qz+hwe6xXD6mmIF3zyMssn2qkcDsWQq4pdHT/qxcYL2sD7GJkU
X-Gm-Gg: AYBFou04N1lu3pJ4kfaq08maqPJsQYYG+X3oLLRZUhdU611wUc3HoHdur0GClWKCvUz
	yn0qDPnfSBPxP+Q2XLai9rvBL0Key2QgTZEfX1MSDNlP2Kcuu7xCkXVHk6MciFtQNp3MoYJYrrU
	8mtXKeas6BKVMZ9axlwKk8/Ir4SvDJOhgxbwpiZCOcdVrvrabtAGdVXW2TIWNryvkZsHDpIWdB1
	Oaxu1jI3O/QiVtdoBbqCB3YhCKiIZKZEVE9TbEFt9fNTo/LWKEuXaHgtwEp3nwNmkVWX95tysWy
	JW3WWi7t4TW35vpQq3uMtJT4P0aDsoOPSs4px9+QzNx13SafUC2u2egLFZO4zXbxSU9z5P3x2qv
	iAnBFEq3/52fEVqLBf5Z82o61pyQKos+gQHi0tyqDdWVF42gEjxfGZJyBcff2LBYNiD0mEvY+AS
	o6QlGCHqJylDnVqKO6H5LalRdzQQxNrPx9
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108990eec.38.1793520300689;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108966eec.38.1793520300163;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord-ride-embedded: Enable Ethernet
Date: Sun,  1 Nov 2026 16:04:12 +0800
Message-ID: <20261101080413.1428016-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hV7VUkin0-NzFUi94dG5T2gDOf54Wzp7
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae6f2ad cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7rWIkOKoExSrKlJ8jWUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXwPR518n55Hri
 9OWxCFD4HZu5Xx6tHaHCy9vn/u71WzSm2nUHU9SqEqD8gRDcLA3gHGtFpS7WziDMQM7S4ElZtOc
 51LvUeNOriofYjEL5gs82Izq142NMv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX4NArS24HRMQJ
 fcNzDajixhc3CW4BrCI+IlFjg8eaXQE7WwD8iqYU5dJNUYSwxZEq0g8kA2KuXJreiUhLdjDztLM
 wUvjlkphevTZN3YRP5Q6rzyPg2CEbLPmJfg2PThxT+F0ndsP1JObtcCrPjO0PncHnWoL0NvQ29+
 BWY4RYP1WTsb2koITgTQeHbZYVndYrZp4q9aA6g7kbDCC13gnG3EFMxJJ7YyTgNUs4MPDxE83hs
 BNzV9vDdnLGrb/i75jH4bvJWBqixu8j/JmQ5YyXDbGZhQAJf0VwrUWq9d3MQRrofs4G/OHCmWPA
 YtsKpbqfBAsnLkUsbmNLkDg/YVjUFRFCB5Vi8Fr4HATxTubJqLKtTnqhFxBuL60lzygPEPGmvge
 AOMyZdL+X8BnZ1F3F8QgzQb9irerjxhdDZqLy4nzuKiR0Z8yBItTffGCOfOMLekaxYgMmwbrknW
 rXCgEkKLkVoAlol01zg==
X-Proofpoint-ORIG-GUID: hV7VUkin0-NzFUi94dG5T2gDOf54Wzp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010032

From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Enable both Ethernet ports on Nord Ride in fixed-link USXGMII 10-Gbps
mode for connection to the onboard firmware driven Ethernet switch.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..50bf4c32641d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,28 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&ethernet0 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
+&ethernet1 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -419,6 +441,20 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };
@@ -440,3 +476,11 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&xpcs0 {
+	status = "okay";
+};
+
+&xpcs1 {
+	status = "okay";
+};
-- 
2.43.0

