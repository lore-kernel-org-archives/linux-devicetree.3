Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542558;
	b=uOn/Q11r5njX/EOnwYj8D06Pc7P393zYFkoQiAUU60CHihLJI/gS78mdIfNYJvf8uoFo
	 AyVjsnPfKwf+0VIESmsIgaO9BtdJVh7KZ7405YuMa0gXpgFUcmcKitsIdrbhweZ0renun
	 NoqFBGhl1WrnwNcF7ZYYBY4Lpyjawvn4trWBUSJrE949OVRA848xuKOMYaXWrccTYMn7S
	 bkgJxStEn3iAdEzHnbPoaL6bX5mLgtPEIVfStfN+JLl4aEd3+h2skttCA+xi1WDFkV9nQ
	 AHA3klmwmZ3TxDEenLuo0dSdh9sikYI8evvl4uCuSUtkTSHe3KEWRtmWO7/5xpOsODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
	b=CZN6OmaMMPuzcuOjk0A8hUsQps7Brz+R3VkMNJRN2MrNS+fINqn/SCyTecsB4fk/ha9c
	 F2op0E6Rqkx33rfcMyBN3vGhBfVj9hYtD9mib1UonzBXHCdb/d4A+C29rM/sho5vu8i4U
	 e/akOfj0wk648s8RD2sCm6atpsx6SvKzmHMoKo8mzwKodblUSCZo3nkc15bRlV7djhAqg
	 nOTGJIZaCSyAKhh2fKdEcwStMND3Pf1Pjw+Hjt+a+9P2M0X3+KK9dGlkqczxMgZKKwxBO
	 gqdPb009MwsoXf5EQC2cAYundVPj5A0tcaYcE0F00KGZ8xJBmBEHSQX5MH0D59oC62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F3606A69B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0F3606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHQUTA2852734
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=; b=I23tXzeXPGo4gL1G
	ONfNNJDfXDfarmV2KsFXi1eSzNzuYr9LU0Zf1k4t0Nyxvy/XipkybtUyHmTPhGjK
	BKkqUVvyiiZR0vIf+KhtZiXXWioep9WpfvzmPprMz8+IHwrRYPHmeLk/je/9gZQV
	h8FKmlc2qG96PUuUJ715F53LZneSGxcnQMWG5uAKUisRWOvdBMyAam59T7qS4d30
	mK4FI52vUse4qDKGfSU1rCi/o4m9U/vhBzllTrGp3Q7cdWxrokiNLEQc8tKjgNIU
	bbGL1IyW3tek7jROTOiqs8XOS7n4k2Ln6RuPET+F/WtgFhygyTkgocb7BffQ1Blb
	1Bgz2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00g3aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92134f1eb00so70046196d6.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542556; x=1796147356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=gHg9r2uYIBk8O4s7T8KNDqEt6u7ZTzrpGZOQuxztD5qvbERcgEYKxo1gK+RiOZsY05
         GyNftDOwwaJ3u2zqC3KUl+XDJI+7X16wvrRTkOW0XyBDEqT0yAEqgGlOG/pQbUA8pA/s
         os8Mfg/gbfc0FqCyD0QIxMzPRIffEYSilRjlI2bB2Q9CcVCRX0GxcljYtjmJ/B29tCB4
         rsBmLaKX5ZBHmWBnpSOIOoIvPsWJWlCXLbSiWsv0TnTshlOJlgH7JMbHXBCH7i2PLqq3
         uZynm9bYdU1xZhcYGjmVU1GJ2LQq8hXwlMn1xpOr9/PefeGDkfZB21X2JsJXaBRaI7rX
         Bw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542556; x=1796147356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=OfQZbDUxGqcim1ZjaAj9+NbG/8Q4H0CfJ03UQCd6+8GRTItdE2G9tAY6XUoT5Nmf/4
         Sy/iI9a5D1VV26zhNYCNKXJ+OFFTzSKtRVfa6joj1VuQT5MDaC+1DFg98tnxdoOsT6oN
         PRP++oGUy+tn13fFv8+uU0TRv4ul6JExV4g9fEVsRwUd03LmO01qmUJrAcCcx86TNMPT
         96FNGViBNNwtIaCgajplc9tXxFCubZVXSkMDvLYMiNxVgJW/hoI/ywC/uPfTEwNzGMSh
         JgCBgSiweN9PYMvyyEUdPTU9VQ50/UwGorpVOJ+zrhJjwbQplaROs9drALepNF9hR+IY
         8Now==
X-Forwarded-Encrypted: i=1; AL+hErGeC1p3j7n2qdcZSX7+i2LEvnED7bwQlTVNkrOrkTFfLWKtLaYs9Au45ajjiV+x/lQnupwsjuUWl1dB@vger.kernel.org
X-Gm-Message-State: APuU4Z8G7i1HUFM4O7I3TG/i7sASuX/Bo4ABmSCyRuqRaf6dOQvnZwES
	y0oZc6B4AFihQZI+faDnwdd97KD6jvUoPV3sTulxM4a4vEzEEA/A4bYWRdzrAdld0PT5sUXFdHU
	O9ereGMJCCPlDL+oO5yf+MTSUZYih0Rl6QEt4OGGyug/nE5HCe05sbIAs0UQVT+24+jhyDYBs
X-Gm-Gg: AZFdTZe2QKcKO+xuLdiYFTbDytBWucuC3tTUQMGTR23/vL09zV04suC25/ZKAkYLwBt
	HBQ9isvJ0/O3EK6k7H6d1WkdKYRcJPEzASwY0uRUVsS4ivLGAdZVEC2h6Ni35d2EmHEm/AmtYcm
	0fyxorhWAlLi2ZVSOdGhp9dCpaBxBG3T3UYah8GCGnGjs4GMjfQD9uJ63XgZ4ASXlMbv2QnYQi0
	3dcEuvYfAvPSdeDyv8i12XTUj9qp03eLSIw4Dzri50SSDlO0EC3D2JBbsZnrhNuPJ1Uzg/cvKXJ
	PwImhEgkXbc8rr+7yntKRWeygVLpj3JCitKM44ITIfdIES4i5Hvt9SYv4dwkMqBSSTW7ryBGrsq
	k6TOD4aeXHK7x68fJGTN/WIEOfJvNAxrBoFbPAOH+l0N0psc98YcnTo3Vm5MP/uLxlTpjthqNOs
	Y8oTjluVTtBq4O
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275871185a.8.1795542556113;
        Tue, 24 Nov 2026 09:49:16 -0800 (PST)
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275866685a.8.1795542555570;
        Tue, 24 Nov 2026 09:49:15 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:14 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:53 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261124-qcm2290-eud-dts-v3-3-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: RI79DQvtXabFlkbC0VMPnUZ_GAsNd5Fv
X-Proofpoint-GUID: RI79DQvtXabFlkbC0VMPnUZ_GAsNd5Fv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX+1c9m5koS5lX
 y8RCY2o/hviPKYuPI/mhPcMO5IBi7g9iK95O4RBcmOgK+c2wqJaPc+at/vSc92UOWEwjye7gK+A
 RCenzpv/8Zxj0+on6r3CY4jxwn0aJ+8=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05ce1d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX/zeTBUuw0hwU
 rV77dm30f+q/EBuwp4UAw3XjVZtYoBvvmBoJGfkBERl+S7yBTCGUumxC4t95A35ffYLhKbiJM89
 F+vaf9aQQkYFrJgj7byknO9TTXsDw1A+Sfc/4J2YG/s+vrLLpt2/O9NR3EoTgG8gVruiYVL56my
 PcHLe8/2wtCtVC0+kHCTAVRU+b8RD73WL9A+v59SPpTxkt0sh1/VYhjarRZq7ri+bp5w7HZ2RS5
 PkvbbXrowiFpTxGMsLQFsJy5riFJ8qbYnw0yMuAjZB+s0/TcinneZm1MFf3IoJ0vbz5Cfd2kg1F
 PKmtbmFitIY7RMx1kp/G+nBnG0xwNYDBmgSJJ3e3PDsMuU4BivpOhzUabf3r5jprPYQ0GFh6lFa
 WrcLwH2ohja2zh13UZ3ze+JNbNUj4oEl8jvIleNaBkSCIeBDrztRCn4bbFbD1e14WRM1WQwHv10
 4uSwNCG+x2ISMmzk4OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

