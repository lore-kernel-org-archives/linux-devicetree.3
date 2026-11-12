Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523193;
	b=BQr5+EgRa4kVW8oUTDv4VRKbJhXVmLsnI90VFyvN9d2qPOu2F8GsLEI3IT4MHamnwcil
	 Heym26fGDQn4MQJqGHnTgk2BNh0gzaaYmozCL70cFReXNpF81aHB38n+uI863aCsNy5eE
	 rB++eGruhmOHiffYNEMEZyO4qfl+Fg7lLjSqD3R02bjN796a7prxdy7fXiYbhOBK0GcQm
	 o7JR6+QDmfDlSbZe/a18vi9uasLp0xCQJRLWPOSDs2YZLOQtoqrQeQ6WNoMki5we3/X0E
	 pHwqIfFKD/xufW30DUDw00hs9VbjiZhf+1x/hAsN2jultqZYWL87CevSevG+8lA3YoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
	b=SQeeJoaF4MTl6CRJ5zFE/o47hfXgA4GriUHY+In0JvvB0Vn808ccDp6uMXGe7CWpKfM1
	 irxkS/mpZf9k9fbGZ9mvVodGW758JFvLRw9Dppa00+GtaLAMZf4/ogqxjWBWaeQJPDQbY
	 Ow81jeDEZvio3Yo0d72cAIaPq9CmFwFXAwa+Pba6HeKAZcx4TVffn4wp6ISbkbeHj5zGR
	 HySXQ3dFqbuoOB2g/HJL2nPjTiG9yZiFrTbK7XaG8dlopjUkOGRSo5t6v4SbSqpGE4mSF
	 2VKzSz+L5Tu766HSSS7LiKpfXvAspIY0lMhUKhD+T/CggswoPtu1gp3ACb+gmVXHpVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642760A381D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2642760A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJaYEG3721350
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=; b=V63K56ZYhmMmzVzi
	Abvhos0ZhgGq878N66gbiQpvGPsraM5OnL7XP2Qof7LnhO78uTu1exsRapupGRDp
	hMh+Pm/TmhoVmH75rLbqRM+1QJ7PgEs4TWHDY8YslJUW27q4NZNPfes2ZyMQFcWm
	eQdIHslArBMU08yLQUmBmodWUZ30+ah4iOYQp2F90dSK1e/zPAbgX5p8DNBcT1mW
	daqj9GY2wl4o7r0LxHzvNXHNFdHahSPt+wtmp9o3gve3KFMi/gZzLJ+k2lKU7mzv
	lRN+J79LnAsL7YpkNnGDuSps4S6VeNBZ+jV1OgzDabUoqPteaYQBT3zqnFMHS8Rm
	Zzpzgw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j2dff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae17c536so212082c88.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523191; x=1795127991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=fj+43oaQb7W17VghbCtiaJXL6dS3HCupr2yoW0NgM4Vyos/XAZ8QLRD0+BQzivJC1Q
         MT+M1Pk40l1v29lvp6bEoPQc+NLmjchyODP/g75H90zAw+1/IoEht1eveBWhcuXJiNXx
         NixaxkG5edH5wjNmFEsyPp3T9AzbvU5HnLkYlpEaFFfHjwxQWPqzr/5mCvMPrudGNzwT
         Rdwr3QFhXz0uei539IIpqGybtzXauQLIyLuGEEadZRrbtl4gcWBV0TY7U8COKWjC05kl
         PLMxEo0V1n1abVUmLyr4dPqIgsXmwe2ya1wG9pgeMifPxfgZgzO3LpRRWL2fPJYL84uY
         RZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523191; x=1795127991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=OT/B7AVj9fgYNMxGPd7jkZSUVaKKZc1eZpzSMxfOiMY5p27fvyWk2jlW/2uOK+RT3j
         J6MyCe/4i/2yx/P1tt3vnKt2vdo4wl5QwJpT5Fj8wTxZlhLjrKfboQyIw++CY1y9t5/S
         f5wGWIHcMdIF3ybLVdHEQRG+WbmBQYniZK56i1C4IWjIS7efepmH4Ln2xmGvZ7ysIaDb
         X7YNlLhbh7HKmnB5U2Vp3r/Eq5uWnBd7ldzUXHOg3yBrS8MtYxdGliRYB0clFYpwHbgC
         J3Dad3gdYu0AOoDCj1k/Cw4v5SuX8OV+SdqR38MAFz6anbNykCWNIMOc6/WSM5oTI4t6
         6wlA==
X-Forwarded-Encrypted: i=1; AL+hErF+L0GJnEf2C6RSP4pktAfDZPgrsjvjlEoYZiR1FXQFopAeFuPauWDHbcCOAaIW93d7M0I9R0mXtJ8m@vger.kernel.org
X-Gm-Message-State: APuU4Z+BApTpTBRYBtH3Yg6CDhAXtbOHsLNOHB8aTFFlqj7hn0nI3d5z
	QLQMZw95Ad7z6MHwVJ8OFN3lMJD1Re5UdofmvDa0eG9KrKZ5bJLiGYQ+t5JVi6CSBA0CbDTdq4b
	C+ed17uft0khFaA4zvtQKK1cR23wGfCQviMp/IBk/dGP7Ue2aP3qWafyewmNif8GU
X-Gm-Gg: AYBFou0u1Ddh5vK9O6OTNaror0dkYGPsxF/lseRnrzOlriIY5DL4Um+mTNeXYrN4ezL
	XftiN5hDQSVgxZxAB2rhRmytxmWdOXbHWgGlx/Z9PPB3J8WV6XxipfkZHUUTdt+RvhGsYqGZqB2
	TFfDXZusJzmWjdWX7UKcwMW6xD2rnb2wnmdgaQITuMFf1hO/JwojL065CqeABFRWVt0+loLfP27
	u6r3/KhNIanUW+Dh16SnNNB4PAi4Dp3eqZ/lXR2zQnZf3VyIshkTAyluLzQzoDY+LECU/aU1US4
	aOjrHhBds8TIDLhX3KhUnHWht/9fkqeo+r+kp5mWZ0ccMH7mHJOFF8uaKC1RYrS7XPG1VED18HJ
	S9Cuq7Dd7dCakXt/Dbe6GwwgVSHsnv9qoTtCtYJVvCobV3AyByKgt6PoY9iEHYrpa3WRM4wMC85
	ahsAFWGJbJ5w==
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr877030c88.30.1794523191105;
        Thu, 12 Nov 2026 14:39:51 -0800 (PST)
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr876999c88.30.1794523190428;
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:32 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-6-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX2X4c9FpCWk9A
 n8/ZSs8JZt5iSG/cfPSfheMzbrIdSKb57iQuFEdBEHmQFlcYgrxB+ZaOrvcj7bD0v3cM56iDm6J
 HKBbFVzftsSo9aJ1Bjzj0NWDJSl6ums=
X-Proofpoint-ORIG-GUID: hveHdcXXfFtzgQ6uoenELCbMPkiW0cB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX4M0EHI41x00y
 iIGNMjhAcHEF6YZ7TT5xggkfwNLYC1PNLjMXJcNosZPMWk6pWAi/VCT4NhssMEi0Jucf+C223U3
 l1CI7JIF9VHOTvqb3pelI51wVghz8tMM7qcGxcoSWq70mui6Whm4eGnGvbHuzVvgleFpdss/Vvg
 oS7lrBXuxUAT/FdkuBUh/tYtAdeGl079832WUB9H/v4Tc4bOw0qng6K+pGA+9hUG9+Do4SL/zJE
 RDq02NjdflxfLAlwH+hu6hDQOE6c6e6N93SfhexlwRaMNyMwTMm4fccJSdJjM/JxNbZfRlMGDXu
 fgtE1/4gHAwO1wNaJjMF5LoLrXf+W8VDBwBROHSLzsQBJWfRuC0TiU9ui4DCAqiYRI5CsX/G9ig
 dgikkyn7SYjleV5lO/JICA0tbNQClTujwL+XpZde1jgvXbMSxyKJ2uD5kj1HVw//fIPjeOYZ9Da
 Ln1cG0YVdm6PwS5a/PA==
X-Proofpoint-GUID: hveHdcXXfFtzgQ6uoenELCbMPkiW0cB_
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af64038 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..a80fd8f96427488c20205c5ad798413aeb53964b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1840,6 +1840,32 @@ ice: crypto@1d88000 {
 		clock-names = "core",
 			      "iface";
 		power-domains = <&gcc UFS_PHY_GDSC>;
+
+		operating-points-v2 = <&ice_opp_table>;
+
+		ice_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+
+			opp-600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
 	};
 
 	lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

