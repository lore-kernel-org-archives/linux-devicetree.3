Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AD472794
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034388; cv=none; b=PcG2ckNil7D8yzCdHrvPMifqyBUrThE6g5eDHvy5lTHXE4ySKOryJXmiRX92riFJB+TUF5fmS4+BPEjcx+vowlvrEAM2M0CZ/pd0iakAcEyzWfr5XHHkJ9pt8yAdfUxFsQXH6WqThHalYEKSVvdJ2RqV4Y30OFSlD9pa1bESIWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034388; c=relaxed/simple;
	bh=oEE8sFPW/1T2tMiecJxKDfC7Q02Il+kF/WVCoVI1/Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oouwd5DyzaFUywo3OLBxBN+/Rdoh7ZSNdvgnOkEHgd6Z7D3HAD9XAk8RYZZLRqoC2ge6phMYV0JfTa55G7/vyUA9nSXAgJPo/1SMiGx/7cCcjCM1atQD/iOwbmOOWmlXWdM4UmiUaEszSThD7hEqcjE0y4/EzrRwTubgBL41DUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ/61Ug4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlUEyJEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ/61Ug4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlUEyJEo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBopHO263501
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=; b=eQ/61Ug48jGoni9g
	A1xxWOMck6Q20ykjrYsrN1kpVlBdr6IC44ogIKPnbW7lOgCekq/PX6kRWoA2mLnW
	s75BGCBBm0Tua1Wj5r2RHVUTWxtJ9c37q6vwZEqKswi6yfMc8ZZ8h2hyQ6il6tiH
	4h2S+FxqhlXLLE3aKaGiYIm9A7ahCQNz8u5MO/vovT+WeQoFbZ01FUtALT98+MPe
	1TIyO61PYY/HtApC+U8U341m3Cq0fCFPRJ1uF7mna9LjUjYkV2JoRR2ODlYCvDET
	dcf2CufuUIGjHzfKE2jBNMdN7PiVhKEIPlazgemHKdWh/V32OawUc7iZyVhs1vow
	CSEwcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0akm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so71565001cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034385; x=1784639185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=;
        b=GlUEyJEo46jzFE7qQDBCeFfpuEyKJesP3VlSvK8VAaBZWED6TWNcKza3TI8LFZL6hs
         HQ8l4WmjZh3u2lckls3LSDGB8LBqYsARBIcdestyXnnfRI0MQ8qHsTQ42wbfue2NWOis
         uqIFS7BUFvHsLytbQ7Uf6NYpkDCQRBGRy2xQzsUK1smmpg/lray3B/B6r1p2WxwmmZPH
         puZKDwYYfknVy2gOjahKT+MxaIG1U8hvV1SEgYNYt61YK43c0G2Nt3KZDyct8xyYo1DH
         GcC34xMn3dmKZotrWkS8QZLfJ/RmDgYK9tJtBe0ZEOWY4MGVOVW+qQSDyUzjQ1WmYFij
         18zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034385; x=1784639185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=;
        b=XruFEqztfXil4NU97dq8fuzGdAGixXxtw8gHyXrNkkDF3Lp0Fxa82ssAsO2gU7SIeK
         FUxk0+8dYIvUk2Mkpk+NgpP5NN4YenLL/SUDTdf2m1Z1MloCBGV9VcIK1n99iRBMBuw7
         sFC+ASg6HGQMBEngtvCzP0nVah6Q/9iU/O37PatePeg+XjddSIBOt0lr3hcp8pzuAiA0
         PK3CezVeESbziLGQH6QkDr8d+UTkkTv33fJbFlNI/CbGn1FlkyEZB+3HDwYGcTRUPja6
         JbysjXb1h62eEH8Tpd9LhRtYr9QN5NA8+GBDzMLpmGC/v7BRibkj7hPSIB3ERdkemkV8
         rW5A==
X-Forwarded-Encrypted: i=1; AHgh+RpO6QmvKrl6+3R+USttDEM0POiERQDVuMsm5Z4gJEIvgUz4zd0+f/gNqoj8srWbX24RXtTSH9GGu8rP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+vt4Ud0aeH8noMK6FxhHVL5BOiH/g580ig4aNZ6h5NKQWG1AQ
	NdzgKjdXFUTcLT3L7DT7ZlqsqK8eFhGHFItggwdfYA/n8T0MZuE2Hs+quZytwA2m1M4il2ppbwm
	DrgW9W+bTgK6rKVjozHESXrsJyir4lxVAj7BiDOP1dxhXs7VKEuBpWP07gR3jIr3E
X-Gm-Gg: AfdE7cmydj08V3U3p9bC1LqWbMl7dd9c4RYdzUReNb9uqkTZaD8J///tdUVCjUClrRB
	83ghV4lpU2BVI1fyv6S0re7HIUXpe0yx1hwVHbJnzlQBGiX5e9X8Doj8bnKzfRCdtSA6bPvK0/7
	Y5puf7RPaBxf+uHkeOJRvhTIK+CLaQbagPeIKQyRQbrn7bAtxSNNHzi6VQJqC2EY/NTKNgc18/g
	e5cOAuBvYp0qRoLgyEQH8KuwrFpT+cjSU24QhauAJKxQ5u1FBkX+h6tk1qNJPKjYhIGD+9kl0eq
	1HeBRsr5d5YyUF0HRl2GyOmrkNChGjwTjKEBsOTh6wjx7AvlAsEPE16PPBuFJX4F/+cPeO7Wc23
	zt8romOJx5sdA2kg=
X-Received: by 2002:a05:622a:98b:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51e3c1577acmr33454881cf.1.1784034384839;
        Tue, 14 Jul 2026 06:06:24 -0700 (PDT)
X-Received: by 2002:a05:622a:98b:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51e3c1577acmr33454211cf.1.1784034384128;
        Tue, 14 Jul 2026 06:06:24 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:09 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=804;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oEE8sFPW/1T2tMiecJxKDfC7Q02Il+kF/WVCoVI1/Hk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRIvusTMk0XyZ3dvP2uWvpEDDpsjksXyDNbk
 lS+jj3ym+yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0SAAKCRAbX0TJAJUV
 Vr4zD/43/XPBu4H9Vc8sVvjo3KI4uD1kZ/v2Wd0dcpxC9OUW7+uUZGM0WfVZZ5PA+pfB3N90pLw
 YK92BdzOCeA4R8hGCii9z5cTegW+RZnVf8p1PwtcerZQYB8L4tQWFmoZwsAZBq3QP21sckH/Ge1
 zN/zBbAt/PNH3EfHIY3upM2bf1RNLYqsMviDpfqz+u53SHl5On03ok5kkdV510EOxO0453gQ2aa
 Lw5Dg1TmMHQwppMEtw1rnU5gfKUKiQKLZs/01QNQr85q0Dw558EcVJURuiNJmOAE144kXwYhu11
 w87JE6E1VWdWWds65f3QSHwptd1kfcIO9I2WSXPKJ/v1UG1w/teKtQZ5N08jQh8PP1qFTARH5SH
 PLMDJTz7CrmMWAiuZbd2PLlOJ3G0DNzlCPLHNtT7DRST4Yy5cT90ylIwahvpvoGPIM7oqkK0Pzz
 RdrB/mgUZj06c1CS67ByMxh8aiWtyfG6UQLmhMvkU+0UrTEI4+rWDtGZ1y6wFmWXx0fhlAARpBA
 VoOrAFpk+oJgAl7jKTnyXbZPBf5wL4uQg5eBbdX4HZnOOxxi1RYtBEjJbMk96bsrXepWFdHhVjX
 z83/8jZ2DuSLitl56KEIiF5ILHvkHY283KPxWTcI/4QT0M2P0q6C4kH0z/Ay9xO4ZKPMkfhMVwG
 SgrFMWgIHW9F0Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: s9b7GfQCmVweOrnGIYBdHY893FVP8aV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX7bhGoZcXyQfh
 H+/cLiIo0smP4QiA9MBa8qOGqiB/pCxDz8hsoF+BgcSgVATjKNpH/z6DRCitsnIqxTQxU2aEhfN
 fyyTPQftdHny6QinYRjw1n58L80Oo5MPEEG3bP3KGGeFB2+P77RHKI+RIQUPRj4PkAX2RH2nSlN
 4bgh+OgQVQqBwo2YtA9U4ugkvI9GJASIBCq0UwZ094rMQf3lRnLMqv0xkb1nL0PA6U1oGnz23V+
 CJV1iBPOXhSag8M4PNQ+kHf2c9AEEs46X1cLVsM8FWJn7LUNuw8DLgyPgsE4OrBOkgBCEDVX812
 7jlPtd/Ev+Pi00tA0D5IIXnP2Iyur6kGIYrYS3ygd0dUwU6Sl8F2Lk6tveftbz+h0UpkLoffwU1
 B5XAQQiu3L+oZApGgzyQ+4QGibzuukG5ojzbgI+tqcDHkg22dnI8Z7PTZReYO9KzWggqqNA2qDV
 RhHn4LPz4o0+66YBjHQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a563451 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s9b7GfQCmVweOrnGIYBdHY893FVP8aV1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXzL40W0jj52LQ
 Nn/w563v4zga70qZpp6zm/1439CpeyTxYWsp5qxHg23IXmxHxrY2uQkzeO+TpABki+33fd+TJBJ
 sA4u30+D7ONjkOzxq54TPB6uk83sEmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index a7d6f9d52ef3..7de4ee3935e6 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0

