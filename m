Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC14078DE
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170728; cv=none; b=ElG47lV9jkqcvtZcgO69tasW19CKCy+NQ+uyUJB6KkiAs3hQB/m+faLpf6eaMZi8OZ++/mxYK68FA7EA+MPeVkkDa3vlycHwHUmIoQItomb2a13rpAlXZoMXRIx+b9xJqw9uVWFu2EcVEP0aou75YgftjS6FpHYj0HqYo4b694k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170728; c=relaxed/simple;
	bh=YTcs5e5Zy3w41A4rx3PBiGkd58XaezQSKzUP8kIM+70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnfSNLJ2Ht4rKzgAQiB/Fm6S+k0l+zFIdAVOjNagsv6JsIWFNUKE85ERnHrkq4GSokxKI07g319HwTO+7ZjRE7nTp7tERffSVdMksIKEcJpWdJ10liXre/kms6NZhdb7/sdouDQAisY0TxdsbYh/KtvslTodZZhHpr2FXYP9K4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZKy4xrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTTDtsQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZKy4xrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTTDtsQz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xhr42924479
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=; b=DZKy4xrHv/IFOwOj
	zMQdYdzaxV9KYF/tNy2UD7KKV7EQqDYmTI6bvo+bFzgF4PECKf6pc7k45VDI9Owt
	Il76OynsgE3Aam1GZ4jxHHsco6BfiIFRWMdUdMFxN6voI2AVItKUUoTpokEsNhQ/
	AUTm/NSV4Gxrx3JNSblSLBZXVlGHRvo8iI8B1TduwkE3o34h/ytB83lQWP5y/YgM
	tDTDCU+b7Z6CPr01NenovhLOpLfRfqNHgJr9hGFw2w5uvENI2DEMLuumJTqb8tnv
	johKoLubBGiIknTPfudflktwsmbSRenAy8jw24n1RxXiktyDYFt1hfSIuWgQizB+
	50dQQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wa4py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938153538caso589197685a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170725; x=1788775525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=;
        b=WTTDtsQzqtD4nUQ5cCiginfYxSCU20NnYqPNQIVdNlU/im5UrZHUjXyfiKo0p5yyYI
         imkkgbleAbnGtz9RTpLQbWU/hIwgrHt/tww3paQQuz13i6SC5c1K+43e+fFQchclpTHz
         05y7RNTEh5NovE8OpPHM+5Y2JIRJh8CQc88kDOxbEGZNMPY/nxv5jK8UzFhCz3yAT0X5
         Rdp8wu/iAqbbA0+TG7TMJXrhLyr7AoM3NbJzCJ0QrOF/PCwZoGKiXZyOJ+1POvuk2rNB
         5oeS+pDgNfu2390ubpoOgWylZKaKIshpJ13OkHIG/ju12/RIz5FqWCZX2WCieolol83w
         komQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170725; x=1788775525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2M/VwU7Ye/1qRT0lofLbBRhIQLseKS0kV9PH/Gq/+g=;
        b=elFmfwuiIVATITt0mbWaEqhDH3gFH9wdAsIr4DnPC8ejHjYvGIZ4Azu6wfhLtZfWhY
         B7/1qDi+zQgAjlI4md3oA8tIuXlC7byxKHW5RZQ5SDig7hOQKo1IjV5LifkZmYEe7kL9
         WxqwlbYZppwmRQYQdyBgWSy3v39kElacD6xVYQa84sZKYJIfxLcNGWfSskjuDQAqGjkR
         zBgvr6hKlUeOmwDAURrTsLibXLENmulNrwzU3JhOY9ot/MK/rzHnyUaC/lsw3TzNpA5W
         ZSiTiEv6SzuXZsgDnEMleaPUmvMXFg3xTLLFNLtIHkp+klLIrHwl4wueJ1mbrxKyLmRu
         3frg==
X-Forwarded-Encrypted: i=1; AHgh+RprzDFr/Jlf6pVTbkNOG4nypwHPBKJX3pMd27eodn3xMoazvsjx8RnUlDOJHp1wa70+Hx9tDemAH2Iv@vger.kernel.org
X-Gm-Message-State: AFuF++mmORNQO5Bub9vcFge/qMhWyENkpfKa73lveeZvqwYQEmPsewTc
	hdglvIVGn5ni+O+HTSHaKV7NT/xbZntPyrFrkOCwpZo0cOyZE/yS+z+IkQtr2hWgd6m0NwS6oVO
	hCRbp62wUwuV/9RvRWoz+kRKWqeBAKwrc1TuRrxMv0QDjuYPxXgarVtHo688XdMRh
X-Gm-Gg: AR+sD13lNn7mCZjePqn7kjtM8p4c67s+/TWVemfeB4pNM2nXp9CVAaE4beu4WCxdHw+
	zY5BQGRsdUdcPrm62truBwQxW+30TZBsE+B5WbvTc77pRzAB79WXVX1UIDDx3Z0tvZ7hMbJ3JYe
	b0AR6DziXAhJbi2rMy0s67C7gwtpDj+wMVYeHGumN+uNL70IM2HCNuOBGxlghyUTxpXra9nmv2U
	p2ktAvNJ1baJEWB53fOgC8mAnkZ8qZrTkqZyPW6b517NCDij1Ur3iExo+suhcV2yymOS7brZ+Ik
	gGG0sssxwn/TTTdbYJ/AbP3pubEnBgK/L1rIPpjT5JsU69gL4KbTmoDG0kwDmR5+f0oc9VN5kqN
	pw/qPig==
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3023484685a.4.1788170724787;
        Mon, 31 Aug 2026 03:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3023478285a.4.1788170724296;
        Mon, 31 Aug 2026 03:05:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:49 +0300
Subject: [PATCH 9/9] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio
 as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-9-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YTcs5e5Zy3w41A4rx3PBiGkd58XaezQSKzUP8kIM+70=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAISgDiH3x8MEulRY9+8GgclTGkW0xCdDMkV
 nqHjJDF6yaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQCAAKCRAbX0TJAJUV
 VtfPD/44MbUz0emop9b+87e6aHFBrPa4YTqR16jKN8qPhea2r699X7v8GWMpigjcSxekxYkoFlZ
 +MOc62yzM6epoA+Rl8p8vMOtlI5WRxpMvEg6CWAhLxODksZN3n4zxQ/ieWMbkxKo8U6N4Gya038
 8UMFfWK96SOGqLIg3Fhxr2GLamdUHDCjo/QYAKVJYrimwEj7Ow4GXzkDlS5BE2XXdtXkYsje7n4
 NCC3XgwBk/vjMZPRWtLwm+cXqb1mRvtBkiCk6rIM01zppxse6tc7BphpulapfgzUU02nsITcw8/
 lg2gPTaYYWH6pFuGGxN53stjPXhMdOKNvSxGdT91j8ig0zdvMiqs0KYqt0zfMAWdLSYX5busMsQ
 0+SpDUNYxDfCaA4AqH7gNirTF22qf8vAR1wW8sMfXNGCPcLGUuGd13UDKF0q0S/r9Kv6z1PBjzW
 tixClVyNqPb023/H6/96cxvymlPtWTQC/++HScdPOsR9Tu+omAlG0TfELIFZlw/MIaR1TIFq9f6
 mZ84hh2yDSUooeODlbxAqs/Bx9QMnVuwPZ8KA2ccQSPv9NbILlukXTkygk1BHlafDR/GGr3UuRr
 zxM+60R2qeFYBhvxq+3V40lPISPm1aWDKjx8ES2ONoXi/Po7jGwmHm3R6QtAp19k3pVwtGbYom7
 kiJcWyRAfDxC/8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9551e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V7ZQ0Mhs6n4Z7cZ43PMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX+Pvq/CnjEqIH
 sOiT1zdWMmUevaiW8f7iFM+xwhrPQU0XE4vyF9FNS6eKXVo8EuzBmCWZDye4V9WtJfeUV7WB6oY
 40w/2WmhccBtUxWqLL0Sg7Ihiop1nt4=
X-Proofpoint-ORIG-GUID: yN0ZgCqOaPPL54CnCbHGg_3BkLPdt7A4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX14d7Df1Cc+Gj
 4gtf/KAKnuzK3jNguB5G7EExsygSVyjIcNtuiy1wtYK8GZPU/P76nqNn4u/Ky5RSKXu+NnaAyPh
 1q2EkSzOOvjvZPhyiem3UozLZUxyqow99jmPm4Jwou/gjLelyQMmhYoci6f0QTFDoBcF3RDj85x
 xOgPI1B1hqEaFdSNSx/qKKT6RI4UTcweyGW0CuoR29898MwTDbLDufD25+AkWb5L3zU42eTRD2P
 MdRCcK6v+zO9d1uReNcggRy+i4MXYw5Gjur+bEoUfZBgZwrRK+k6+8cQtMIb7jW0YZvZxMAdLrZ
 2G1kD3dzTz5vhBe0PLdKJcrAm3iINMZwH/uiMlGUTNDjNS9XS73MVyC2C9sWfXzhmJirLKYDyYM
 shm60/2Nlghg1CQoXqRXRRO1pMeLntLlZyxvFtPDcfOx5amTwlH+6RrKPCnpcv/W7FYj20T0PZY
 bdHYlfVyY3fLU/ejDPQ==
X-Proofpoint-GUID: yN0ZgCqOaPPL54CnCbHGg_3BkLPdt7A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..19ea1add016c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1180,6 +1180,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

