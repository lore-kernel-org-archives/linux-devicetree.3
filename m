Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E514746A3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120552; cv=none; b=axlBjtEnt0qqkjGGjAWo12pOR1oRhccr9KkMENZacJuJQ3jRZp6DygdvrPzo8vKTSAPDT/4zlq5bHF+rSK1GSkXevus9SSj6cf8Y0sSSeT6jB5jYcWMNHNDgtsN7WXNflzPuAwmRRbPzX3Cw/czlri5uerq3HfU+e91jrTBU4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120552; c=relaxed/simple;
	bh=nJQ6r5H/0sbm3Ipf+kjtgpP49WXNkDAOG+3GlAnq39E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFd9ptuuhHgeZ7Avx2bw4LzXpcq9Rw9HA3AtYcciq0Zh56T1p0Cc/5WWWdJV5zXzUV4lGkDdzxZ7E98Wj7y1O+kOyGQYrWjK5qQvkYaLXNLABPoL6CFw1qRDqMX6P9sHLF4MMgkKNfzp7R6WJ3L+Y+NVSlid+Arf/aFLGe/bkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wtvq9qxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8m29J7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wtvq9qxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8m29J7u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOF4B1508513
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 16:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=; b=Wtvq9qxDUBPNewjM
	0q7r7w3VPvrMOhvXXffKYGZy3aF1j0Tv4aI3gkpfDF2FhRtShNjLYvJnXddH4lye
	OlkovwAICLojNh3CFq+3GK5Ms9PWpm8J+lPgzbQN+/lUTjfpzOmE+1C4HVayD65U
	D1kk2aGaYOYqb4rL4MYCWK0V48rwTuUrnf8CnmnGxiTomylWwbwRc81uYDJn8xwx
	4SljOxilLkQlPAuETVGFq6Et08wqK3EwJEZqk0gcVdNpifcpcmx3ZcgHQiYlG3fD
	Mg+L5xsArGVfcdyfxCTsyTphtrZqc6D8s+EE+pHkH9je0PTq4jqWIU9K4QQ35JCZ
	0/+4iQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fw0ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 16:35:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cea6a46766so60375535ad.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120549; x=1786725349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=;
        b=K8m29J7uGMuHRZ6D2FCD9IbifEl22jgn+GAqyj1P/HS+svsvk32BkoSTABrplz/cv+
         puP2EUEqRHWuCjOlK1H9QWBEpt1qUzPTNw1uwXrN2dJVkiQfitA6jVhD8eTsXLO3TdHy
         QzO7FsfYid036wyoJ6pI5MH334xecBy46Iyh/qC+RdnAwnniDa3/0LYVQi2DILsDYrLq
         tZiBZubpR4sP6pbPSwA9rPqazWLwq1Ta6lJCMnNvj12goYaVbvt8KdpsFAPu1F/68dnq
         hTyhZAHe/HeiQznMeiDyUGSTH2qIqC9NJRxAL/agZAFxKGgr6eFZ3jronl14NWFSc+Kw
         wu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120549; x=1786725349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=;
        b=J0QyXKzPD4OPE3/0ZBIVhrbJPbiCH16nrmicrwWf2T9RAbBJqSaXW5oQ3frhYtDnLm
         5kLq17NaP1VW1b83T6SpgyzZrkeipvyUkEJUKdQsVpwj4zH/VJ5TlETIpCiVAMzo0F4o
         8ZDacF5uZqHjVrLKzMEuDVJSKZlQrFghtgMzdmvdj66CB39QG3uGjO6XMCGBtq6z0DQc
         bu5fL+OY2MCawJgzhxnDyWitxSf5vhwf/m1c8FQotLOm5S4iWKMO4fzoGObiRo2eZs2w
         nc+UwgEJ+q069EXMxXmRKGD/KpOlKDzQ7x/BIO5y5//g/tJ/mF7s8XC7z28pWykS1aDJ
         plIw==
X-Forwarded-Encrypted: i=1; AHgh+RqJZenpWeeJOdKLWBe7yrAOWoOxu1p3XABkqG/02KMlrV7Y6/1ZAyiAAB6UnVjlqwdEaUXo81SVdwc3@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTwKJ6Kj9/MHC4cRxdzkfOPi5GHOvne0HrFfsgvnGU0TrOeJN
	S5ZCUEAfLMsFpQG+R+BpXAvZhSFyHiDF1w3MeZqcN+FO7OhdxzVQ+Gd6P1f78jIHVulX1eeWv/h
	Poo2btizI5k+MkKd+O18xWvOcouNtHCsmTNHNWxzYM5yk1ypDFrIO1/FfcVoUmIYc
X-Gm-Gg: AR+sD13ddCNCm9QcOrdz4JVTWGjSiF3BNT77jXjVLXIJ/tyn9oqY43NW13ZZhROwD65
	aOBkRiNjh98CjI2NKL2XSceXNsxb6I10IttNf/NPduBwfXV53JSX1DZLJ1yeIedbYNSCgtLJsQT
	b6VazvLa9O5GnHucJhuBYKV9tYXIIRoRNB+fx3TJrj4nSb4gsBX/QWETiZcJa3ub7ehamhhSJPP
	nXXI2PrteF1wLnd/pBPvBTugiS8KAPJvHTjvvWQwou9gTdJ2UapPs29NP+ajZ0EeBB/USDTKuOy
	Y7lGySXKUi8gG/jTMET3SypAS9kdhwHk6cg6H0D8S6dzaAY5AkM6fRXdE1UuRdnmgI7h871gm4H
	9e0/6YZ+Ayd3hbhax9KIR83qdBuswNt93gNtWsgNo0UrCK2nG/Esc07u5UJe44dP8spAbWqWVbs
	Y3vDioFEvZZYs=
X-Received: by 2002:a17:902:f682:b0:2d2:ae04:5712 with SMTP id d9443c01a7336-2d2ae0457f3mr9810525ad.21.1786120548810;
        Fri, 07 Aug 2026 09:35:48 -0700 (PDT)
X-Received: by 2002:a17:902:f682:b0:2d2:ae04:5712 with SMTP id d9443c01a7336-2d2ae0457f3mr9809475ad.21.1786120548223;
        Fri, 07 Aug 2026 09:35:48 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:47 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:05:31 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad
 SPI mode for SPI-NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad_dts-v2-1-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfXwTWT3dWGhmO/
 WaqUju+1ZDKfq1DtIRSki6D9R/oMyw2DVVNp7fP+yqBABk27bUaA28zPvSoPC2irzIGCXaF3yZF
 1MaSKOd9uzKV+IqDKYmB0JpchcQtkLYao60mK1xGkzkYPTsgR8SIqRQXBJj0CX6ZU3Z8fTV6VMI
 Dx65w7m2dl9YeJz69RrOPj5gfuWN7HjHUHMdM8SXdkFEAfZEbNLnNIz8atlO5eXsCt/9Xmj/zY5
 2zzcYCmroXHrCwH3ZKlMT6V9/fLH+feD8isMNF4z9w1n7DQHc6JGA4uesWBBitbZ9gvrysjZWVE
 uHq7fTCNRFJrBkvGcWrTzYI0eN5c66DCCb4Oa+hwxP1xx3tsQwvy4sjK972eINlf0t9AWt/GjxU
 b9+CqhDpPBk3jXdoG4sR9rI5QJMDNhyk/yAxBmqPcl1EpHylgcEam3QsNDPBeYYVmalM5qLyGrK
 V/92FiZhQAth7k4KLDw==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a760965 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: osaouWaYjJCETTm3wT9x7FFAM3eD-7Ko
X-Proofpoint-GUID: osaouWaYjJCETTm3wT9x7FFAM3eD-7Ko
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX5hpdgH9ZvUGy
 dGPpCWHuHnjZFUP4dgrIJ8a7cJVdKX370pqfa6bupM5FwT6uAiO+zWpa74vF1k97vTBLi/hpKIF
 1p5Iz3dwzWFglziDe5bY7UikSlAB7io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070129

Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.

The board supports quad SPI transfers, but the device tree currently does
not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
the controller and flash can use quad mode instead of single-bit transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..86138529ba77 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -249,6 +249,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

