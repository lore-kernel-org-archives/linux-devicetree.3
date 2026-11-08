Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143978;
	b=MYGbAHS/uMjNVt1LmOfZL+cSRSnDBFu5GFkzRJRacG93b7GKBJEDBjmhqLpXsdRd2rYE
	 C25CF/jcWRGLiogbDpp9EGxXd3OCoyjfj3765ASp4PQeUygJHw+fd2tGQs4tKUJaRLrRs
	 JIkXsXZZetAlsL6KaWga96Rzn+vgy+3EDx1XbVQieBCXQ57zbKlWqUqorGm1Y33R19qUu
	 BENJeWhpOOFsqlmVaKnRA1R0TT+Ht+W2SbQE2yplCUA2eFzxTEVw9P8Lbnnb39jTMixx4
	 uCdfYi0RSygC+snj+ctPXPNnrZoLXmt4fycLBs96ZrS0GhhHmOerTtTth/0QcIV854w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
	b=3eWaINlw6IXbrw8FnUME5rUVf7CgvvWs3sawCl1uDUWO4Gnz8yLhk4uWK3y4gaJw3HgR
	 h/xTv5Dz9+fcySPiNcJiYkaW1s4xclKrPZNXT17uogMQumrKIDeJp3cxcafXgFx+XEjpY
	 bJ+hEI4q/BXdDtorgb3bPHvKgg2UfmK+kPqdO5XrvQQnGoFtl047oXSfXtQC+qDkyKDji
	 AQC3uNf6VtC8Q82DmPNwAn1h702JKOShHxuWzYJtOr7BuDxWsIW+9u/wy402iJKGvxVvn
	 rH3dOsQrD9yKK6gtZRJ50c1l++S9p77j7yGgf3vNtHdDFktrvYzdo11yHstMQz8XJZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC146606D801
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC146606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgGfC1858644
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=; b=oqOeAZcf1CEBgkNo
	osfPDYo2JSn6y4y7fric9epbL108442IsmosBfdD6B3zuzn9G7n1+chTak2rCo4P
	acnZWxaanxa0pzMhgcD926zyEH3ADJkBL/9gImOYXkPLjNAu7DIPXS4vbnGwqNRb
	MDIbXOrhYo4HkTxJHXOzF+APh5XKl2J2QMpHoNZTzwn7tnk1iBGCHr0EgN3m/IeB
	GdExYaGKmsFjHfVGW/N2sNhii2PWNqRXDBJdOwH+KGk5F0M6tmCrHv15GgjCAy0Q
	DCaSMr8StG6/27ncMjwFHZZM+UyDkdXSglPoXGZR8GQALPqQu6khytbj4kdIOGPD
	ibm0Zg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06u43f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so48681eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143976; x=1794748776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=X+M8LweeeHu0BRPZnpXRxOSu/lsgE0c4EtkF3WPdg7cQ95kkkvQYoRg4O+aZDEzzMg
         y50E0qk7WL3pz3AweRW2RHVlNAYirWl/8NetZPxHFa0wZZyD4Pv3uV4n07sAptBjNC/g
         IVdreBGAtD7JVY4y2LcaGhBDtLWI0KXVyNFix3VF410JAzaSREi2AKzL7fnix8gEpHzO
         CmY/sjs0y0fRQtGxGLpT7D454AtuuB0MJRaBaemSHN+h5nxs8tWqJ/hsLsMA5sRuvwjp
         erd7WQFBLIj/RkUYOMEoV3yFjXrDVOES+ADTu8Rq8PAuhLJWkIr0XDyzpXhOxrKeFWwz
         itiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143976; x=1794748776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=mO8d36rrOH60alGU1EnaQvG45ez/aa34FRdTe9MKWYtB2LFwFGoQuBBCCLsnwSz3iC
         6iNRBlHS343vV8JRh9of3a2SdceZ6OtYG3beladFpCw21PyIBatl/7TzYeO9vev2dgWD
         ncqJWCdszoMfFQSDJ27ChN0Y2vGgncYT3aUXFmJTWT7n2s2DhGHcXpeNYAYZj4tOCRUO
         Wu74Q2o3mCA29FqXGx1iqzhUol98wchMkTbx6L6TwFQDyzTO8PULdD5pSl3WjdKiEOLv
         ppM3Vxj0tVCidq17MCWFUCQ+gGwqoZE292EUwulUijBMFIKvW/6v22RKPtsAYvFBBMhV
         E1ug==
X-Forwarded-Encrypted: i=1; AL+hErFoRd9yynUbU6mEDzt9U0RrNR5l2wYeukpvnuLkQL2PmT8HbXiC96dA9171INBs3toNe3Tk6Hvyztzr@vger.kernel.org
X-Gm-Message-State: APuU4Z+K8yNSjGu/xIPnoFgkIoATBOoHEq//Jur5IvatgO8VWeveqdcq
	y5NTwU2xSYtN5qM3qdIkAbJBpyw1KE2u5X+uiyb4crLydpNTROiBBu3FPeoAbJAJEsfTWxo65n9
	R+1wluFXaFKfKWrpvY9vsyhYoqvw1e6AKNFzS5Qp4rATeGorrla3yPDVGopXmad3H
X-Gm-Gg: AYBFou2jRQL+MsjisLlFHC/ZVKPvOO1FXuQdSDg4Fmz//YPm6Ql2Hfg1iFdASSZ95TN
	ZjLU2nKJrtoB4PbDxziRNneNshuN98+qwYczNP3cq+N8GANmFzrJi8/QNIJfTA/MDkS6mcy0EnX
	bpa492PsTAlWGJq8ow+TUgYUhGDqD5V7NkQcF7e7nJZt+fL+84thxLrY6spe/rXB3YHufDIBtSZ
	mHyCoSruLif9jzQK3mnhGDH+akl/r5+tD4RpI1t0ztXMTZlCq3eTf9PN5dQfaAF4jlckO4MD35N
	EuhJ6qWXKT5cDyhkHYF69uXXGCBdmL+ZU2xWj69NFmpOBg6fmTIlHMVpuMYwZadCi0yaeOjEZpJ
	bb+77eNbb7DWkxrckn5WyfqaovzzV9ptxPpcYRFEzhCy9AB9vh2JJg9pR7twJcFHI/XHZJNOKiP
	k9ewE=
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631570c88.14.1794143975510;
        Sun, 08 Nov 2026 05:19:35 -0800 (PST)
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631545c88.14.1794143974998;
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:31 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX8Qyd1IDBtpS0
 eWi3k2TJ87zv03uU/HFY4AzFJGV3fbtJazzbdZRNSykVvDt9gtI1zWs4nQaYtuRA06FbJ/EupUd
 tnxpXnIxSB4W5sV+9rQ71cK6Mm11t/oPZMK3/ZcsKQOEKkj9NkzCp9s5gnTVsUrlBDY0PZLmwUo
 hodFDNhG9HIZcJrqVvT7FL2zEK+Ca0Z1+qMwhTnjriC5XsiR8Gsn160hEE8yxgV1aMOTknXhPX4
 9Cw0AN+/lzWqIGCwC4Ms+F3cPeOLVatQaMlUiQl8ZuvJLv/nNWH8oXdFbKvSvHeg9J3H6ntImR3
 B8ldr3Z9sZheyHi+4dIj0aTCwDYE0DaiNiPgcJ4ZNQ6a8OPit5jn3l6mcqiKSfcBGL7OO+nwNek
 1OuQtaNNwHFCssA9J5fqPqjSw4Ew8+mlGWDlaaHhzl1vmZdgZto6wjy9ipPH8v99mOtLiIluYj9
 /uFd82gJyipo5+NUViw==
X-Proofpoint-GUID: fVGuj9KEAf5VRBkml_3ipGehNBhriyy4
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6af076e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CYmVgZtmzWouJOFkMRAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: fVGuj9KEAf5VRBkml_3ipGehNBhriyy4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXz2IAgOEoJRnu
 vXt16i/5BFpl5Ms0GUnxZ459iEvdDGgVGB25pVi0jlnDZLDTt4H7Wm68SEmG7vyq7C1fQ8voSti
 Y9B8trFhJ9CttX4XPljrJ6NpR9WqX6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..1d5f27336f73 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	ptp@1c80000 {
+		compatible = "qcom,nord-tscss";
+		reg = <0x0 0x01c80000 0x0 0x2000>;
+		reg-names = "tsc";
+
+		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
+			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
+			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
+		clock-names = "ahb", "cntr", "etu";
+
+		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
+		assigned-clock-rates = <250000000>;
+	};
+
 	ufs_mem_phy: phy@1d40000 {
 		compatible = "qcom,nord-qmp-ufs-phy",
 			     "qcom,sm8650-qmp-ufs-phy";

-- 
2.34.1

