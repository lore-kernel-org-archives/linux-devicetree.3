Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220746A603
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649091; cv=none; b=uLE45FmQoD8R6dOwgA0J+2gkHGLjcmIMnaCFSL+Hvu9Ctgb4COl936+crUFtre3qexnZ8S5yGmugWzHpEpxSdN5DZ0UFAA6Yt1CoCvtYn0HvsH4vbwkT4kUj/tAtQ+HeQ03wg9vD79Nk5tC3OrwzofzJNcSfLAkgkRDZZe1G0vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649091; c=relaxed/simple;
	bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se1Qy+8b4I8p9sCZ8klQYHmLNT6nnGKkKtIqAB7Z1TV/NDi1kN8OEPYojdY0vvFr3kboz5ouRQu8TZSXKGJE7zq6ixxoIMT7PlNsRGDeoiPvL4AMgZMkP4BW5hVmp6TticLfaSt+ljfryoWBZW32aY7NAwxumn8RtBTBheqpZRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBMT5xrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkEfVKDO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBMT5xrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkEfVKDO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0Ji1971306
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=; b=IBMT5xrFovw8HiDL
	2+B2VhyqEqa92pMx/2CIqXkcEbM98yfZu/kHomQbEabu1fDN09e/6KLKZ4mClFPK
	5PuvNBz8VkqDuMZEMaJXE8slzVJNELUalMiQC1H7hovdETIcwU7L9z/XGPKoh8v5
	xtcULSZ+V4ZuzDw1cG4N2SKxrvsOkCwrXkOIpXXaZfq7TI+A74WywUFkkS229D9Q
	rZ3zB+m2mfS8L0iZ5TVmEiLRKWfbSLw0c84epiP69SItNnbyFpgWUJlJgn5sMVis
	TKFkNT0YPgPVN4sM63WwNvGZNFefp89HojkjpzUXZXQprS0NJXqj7RTBrr49U5Jg
	6/NGUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6861r36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso146290941cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649087; x=1785253887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=kkEfVKDOn94PbLtoTjRMw7R5mLx6DryTtGxob9h/LP/GwbjxrgvNj9+fOV82Dnis3I
         bxA2t5cuvcWyu6YCgWRnm+FjA2JcKzl662F3OTrK9BGLJzHBL9ZBh9PX8JFs0tTyKXO2
         DYHUg+0zj5Dr4WSPWD2wSkxymmuxnvO0pSzx6vnEKR+lVOzmwlDkRynLgguGj2VQDBr5
         5Epv3WlvtsAQidCDyRDaqWs5tzVeaS0kYveyNMGJsupB1NF3jdPHXHyQecY3K9oPg1sX
         VljGTpAFVxPdFdQCekmS3pXMWwVL9KL8UpHiQ8eyE1/f2X5FghqCAP5SFfe3fXzMmAUf
         I0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649087; x=1785253887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=T0qYqoXKdgFb56hLFUHTnlU8fSzuWHiv/XBbj9Qpkcy+0SCIwct12l0k5zsNvodi6W
         mZgt9WAC9lBEBwrby+DSg1ytXjKp2rVRmJ+Zc0K+M1vu3wcXx4w4PfGoQxWoqvsbzKlK
         Yz0wKVBtC4xvvhr64zfc+LZyRDxhAsOGEHZdsp9syKHxxtCiZCKjBOXkRJE8HbULDpfm
         JwuGhwRACbIYVeHIoQ5huosvCQUHsOnGBGYe63Rao0s6UOXbm7SOQtP0cWQn+rWX7vGa
         s2Gvgct//qsxnTU0ZdALdMAcGlx8aaLZ3q0BfqHeMCGKJ2ZaAHbXSVVS1KwYQP6SOWX2
         9JxA==
X-Forwarded-Encrypted: i=1; AHgh+RpOTjC7sguQhies5DJE7Pzsfb6wwNwQNdORwXwrv0DP5JMfuz43RL95+gmeI59e3fkXI7Jn9brYAUox@vger.kernel.org
X-Gm-Message-State: AOJu0YyBs26z2BLtoIZBT5fsCSC8V+Qp6hAoUwJrL/wFRDFMXD3hziin
	mLW5p8IOQWI0bxi79hIsxJhipQpaaBBbn3IqgZ3kZSwa4k9eqVTAjX5Vx/Mu50FqRHFdCiTorFz
	mXj7g4VmYhvRKj5wuW1l/j93FTup1fWtbZeyguYlDpdSgh9QTCX7Byjg9hJHJG8Ss
X-Gm-Gg: AfdE7cmQHRQgeIEm6BH1OpZ6dJOnlF4rRaSR2bxr3M5V2iEctsuKvP3dBAEOSlq7WwC
	bV908Aw5x7rsOGMWV1vuiPNXahwd8UehP9hnyex4qQJPDdSdQWjNdY6LqnYI+htWt3kMtLDzZQW
	HZq26DwJKiTp27CidAHe2A8hg6Oj03hf+tvrCdqyIiNRODgHs0l3z4izCoytdoTQk4BTeV7zNh5
	uxkp/6gKA0VlDcXh6yoGn9F9HPpo3Ea7zFEnD1lemXuGxMzPcELzvVIyd+FfJJs+DIzryix7gPd
	zO9/WSmD62QKeXTWVlJ6vJCQdkWAyydHsHOm8r9atQ6SzkcvDRoGJJ5hT98Zlnvn9FiNVNkmpTz
	Cw1jH7t1uWUvon8wbe8sC3//N
X-Received: by 2002:a05:622a:5790:b0:517:642c:8196 with SMTP id d75a77b69052e-5213bb2120bmr200367991cf.12.1784649085505;
        Tue, 21 Jul 2026 08:51:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5790:b0:517:642c:8196 with SMTP id d75a77b69052e-5213bb2120bmr200367401cf.12.1784649084840;
        Tue, 21 Jul 2026 08:51:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:04 +0200
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-2-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5V0eziYT4zo/CUhz2UU7ppCwYhnnQOzsoXjH
 Ou+szTLBfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VdAAKCRDBN2bmhouD
 17gjD/4p1+5bagH4z2jSkAyNbR7wiDtlhMelDsopTJ22sROiMtRbwpMVEq0r/zwDDz1QmOIa/v7
 PKl5H9xZIlURhUlj5/jV34aBB6IfBc8INYbeTAUVb8MKST7EA4gJbhxMdklSTptI5KMZuIfGrSP
 zHVoeZYQ5nJ3ykuxgIczVzRSZo1z9XHKKH7UohxMT7p0hssVIzGWrg7doiJS78q83PLLUXxjtJ4
 GLOCS0fRTFUkpz3Yqlzgc3i47mZs48PIU7txKy2pVxIeIpHEa/DGy2BRV0feHali2dYHhwO45GC
 TGxvdSxX55Pnwo8v1mdd23FW5X5FH1PNS56uTDx5L6VZ3KDeVAlf+Qne3yC5ITjmN+rgUMXt0CX
 GjEAXDQ5u7ilVWsLweGjqEPPwLKdAiM6qLqT/Hr69nKiU6MuqInIoqUundXo5CFmH8wD2EuCNCH
 pOo2ANkYgEFNWOFY++TBIlnEjdxrVExDpAnpx7h6J7PsX+/olZyK628U3KSFeCAuTn3NBMt9zCT
 DRVFPXrblVggyi0cf5ZrT2tFOU/2b7HUQMYpX0oYyMCImC96d8JGuoJcg6pRZMYUHHsyhfj/5b6
 CW+8ZDBTjy75RmVj7qVRqT2cRnugyqMp6dDTE2YqtYEukXwCoSZEvmE7RVZGPrXjZcVd9nvJ8N3
 IB4D1D4cbaD4H/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX9Zel6BC4WMb8
 BccWM7Q+NaKy0vsaHTC58NeDqCzY71466DtXyY8p1/deyekOfh+Fs3uA55pKYmBeLpT7QE9Pfqe
 9t3rKt54QWR57JPR0fApnxN0x8Canr0=
X-Proofpoint-ORIG-GUID: td9B5hyTDAuidNfO5IL4KegZezATwZAJ
X-Proofpoint-GUID: td9B5hyTDAuidNfO5IL4KegZezATwZAJ
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f9580 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfXxaI7Vr2F1wXT
 rDAGcqtqTux5QhAx6zi9CZ5nL6saTdm5X0mEFe0Ee/qyTHorYo9BztubydE0qeFxggTw9SEBOZr
 G5i6Ev1nfe3LdVoWBofPfz0kKysXjygdYIbZLojy0V5sbWQ8EU/vRVTYfnZ3ZXVP4Syqo9k18ED
 6UCZdWGQHoPlaDMDiTDXu2S2pSy35DxqpVBCkSj7v0By/cW+7z0zobaPUm9U52Gp22439R6Dh3K
 noE9eqyjr6qEPkDCAXDj4EjT9hXRCOeMyDrizYWirjVbdukv7Azt6ASaHkZoc0fcRIb1ZbWiLEk
 R8Z2ZMbcHD8+rreVAeXzwt59IMqfiT9uP2qPn16eDH6Rxe5uuofXBtTH9udhfFHlSFg64/P/FJV
 DsPJVvzTTOKl/yycx4E1aMEIEd+OZj3lDrtkq4R22Fr4PJtrJG6s/nJ58ghFBe1hz1eMe9MjJ3J
 YwPRa6P7/AqilRxFDkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210168

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx, qcom,rpm-xxx and qcom,scm-xxx for SoC with code
   names (like qcom,rpm-shikra)
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..0e921633dca5 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,19 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +62,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0

