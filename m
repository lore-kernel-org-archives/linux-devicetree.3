Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F97834A3AB
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739715; cv=none; b=UMCt1Y6hagFEaDDQLGDLa7uRs/I+KZcF0h5Qmy/0GZLOx7oM/8CTGYp08HsBeN2NPuMg3s14FiClnvkxB9uiUJxXuRatxBnDhDW5UIpszkYSg21dh6zyZ5u3HMxYai0C4JvizeeNboGWhu8+1a2AbJ7zHF/PajPrGmgq05gtuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739715; c=relaxed/simple;
	bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYajM+k7QDdRhk1Gfoql4u3ORqphLD1Nia5XVKKg/nEYErHGhKU5oVrq+XWergDcxYqpIHxiv+pl4vFwaeHlr3SmsW7hrRmbQlHCRDwcELAp+3BcPlDzELT7Z3aOvERC1/912mDCN6aCEMABWm1wqo6cQKuDroYThRAXGQePdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3VI+g1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQbp07rt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3VI+g1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQbp07rt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGYpa017319
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=; b=f3VI+g1E1rSCncp/
	b/kMC6Idy8K4+ko3XzZwFEYmmGZwTC9YQYRAfL8WODGLDcv7EEcFVzuN1hWkmfyT
	zAKmMzgByoKe2dNr+pEMO6bSUoqabXPmAgtSY7GzTcWwpzsdRq0Mzs5WEq9eTGaT
	rBV2WL1RPzTPkZMpwIJN+jZl/NZnUTF63t6TMq5UAWDL5Gj/YoikdtYmzF9/fqHy
	OpgNEs9fryYhL8HoQlsF/R9Lty4VDP6bDzDKyeIWlhyD3GrKzaQerEEqMYeT5GNO
	/FV55Vi1wbh5i9+kBOoeZqheo1DNBH/Wzdh9Gaiwu72JBjLH+efxSdzD5VpTHwFH
	uSNslQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3d64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9077b4c35c5so14402136d6.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739711; x=1788344511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=eQbp07rtXFlKXz9tkSJrcHdwfa4ROHSkv58q+jVEBSyN6I9X6cqGVEgbuAgRrFDWY+
         pypyOPZnLoNxpyGMSHOp0KIDVLSkA6lSRFdAyJlu+VmX1pYpQNhRuLwZT67Ia9b98qRR
         mVpYAK9Twc8YNsrZYl0PJbZ3DsB2tAVuOBxFBV1uabugtSFa26Goqltn3TkbTFyEF3Mc
         Ct8SORWP75DjTWhkaoRJHib0X6ef3ehYr0k4Ft2Svvh/IOgFgvGJx/hjHgqveH4zVsOv
         XhCE+Wm0crZiKg181db1Cizm2Pbs3DwgPiqOfXkA8NFBS2FQBgzkAHk+j+uy2mYzEmQP
         A+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739711; x=1788344511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=cNJ4Wd5SxzY45pBe2WSN0e053NDlvVBh1OqT0E8/yDwT9RPGPxpsvyP1rTNYSpmUyw
         J0wkFd1hwH7cqVCHv1ID4uEPUWmUQfONk4UysEYfYM4uHxf+/5LG7Kz6jKDQzYNQYJpY
         JUFjWT49sK+Nw3HEAYzC0ZbdAnLBdDkhDAinnxuLIEnCDzUZkMSHp+q8Tx7/edf5LhXc
         DGvf5o0jG0YvZl64ZSWxX51VNrnHC8dAlFz4VnlS7ywjLRr11tap7rD5KPnUOBMPa1QN
         qLGBHxAzQfhBIzm+M31FQbP4I51uXjYf/rulVjvXr9OBPMtb5nNuCHWLOKTpFv7B0XQC
         9XSQ==
X-Gm-Message-State: AFuF++nbY8jOl8aNRGHCX8WfvLd7jTElP6mAY5AobRsBfZmH6EHaF005
	jGwLLYtWrGuWUWlgv9GVIkk5YtFjJ6v1ZiBOSz9zehrvdp6Okl7B/oSN7v/kocghN7hZbhq7RlW
	K1oPy73YbRTjP8xWeAhPkj6MZdZO14TWePzTMEmQCh+81enurAMTwiWNf/0jS78ofFX6qsvV9
X-Gm-Gg: AR+sD12S4O7yLNGXjF7reM9APFoO7sCqQpDXrKGJUqEKqfoJzfuEYWVoSTjCm3FrSr2
	2TAcshT835uv2DBYRkTo4Aq362J2z6qbUSrN26mmj+KQYSfBh0NPG+bNsX9qWPKTd8n/7h4hy75
	c8eWwKB1i/WkOpXoI18y3OTFx1dEgvdHUfIb9OrJ5uxSglYFEb3ONQH3uLCf241oSgw562YJ4Zk
	Pux8/Q4hHZbIw2iN2lbsFyWqQFQI6kWGyIyVIynI2rUUbRvnlCcoVE310MMggWaCKjrcg1mA12X
	0Rm6pRVATK4JPn6wd8SRcsa2RqChykMLHxiH88c9KNwp7RMQV8orIK+9pITnYvSieRk/p3G+dCO
	OQHD/RAkUjfoPWRfck8KvEls=
X-Received: by 2002:ac8:5744:0:b0:52d:f484:eefe with SMTP id d75a77b69052e-52e42367a41mr40040781cf.35.1787739711421;
        Wed, 26 Aug 2026 03:21:51 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:52d:f484:eefe with SMTP id d75a77b69052e-52e42367a41mr40040591cf.35.1787739711051;
        Wed, 26 Aug 2026 03:21:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:29 +0200
Subject: [PATCH v5 08/10] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-8-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4rU1QI+9X48eIpjuU8yGZSCKY+WKWen7KgM
 0W84LVzzUSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+KwAKCRDBN2bmhouD
 160kD/0QcR5SHoolRY+NnGnayp8wW5umKxA7VSugOvjG9yfQNl14qqwaiWoQRExQyqMlbf/O7Q+
 hY322aKD5VQNv4+MuGhtRCgYLBwHpn+l0UuC0kMNCvsFKktHiM23BTZdNM2UXeDmbdtY7JyYkcj
 OorlPNbqRlYqfRW741zfGjFS7hvKi9gAU2ZAdcjZx90d4vv74ZpqitavcSGznZltyLDuKFcS3kv
 fCLrMf9y1C2dKRDVAXPBG7jOxAl7JfIXKgtDVe83TzbVsQQ4gfvMlUwnRiZaJRHwHpqzNuQ0n15
 1V+PNi/EwxRPi11GCsulpP6PK7D8c7HZZLcXVqxEEZ40mSC2ytArdMplqDS5OQoaevkIW923+mE
 cr0P+GTl8HwJDo2vxUrWqfd3+PuWpD+Quyb6X6NWl6TCatZgIMYBfVSWC8cR4/bDYiQxrHp/fXT
 jghQ8doNpDVzbVh+Qs7fHPUXrjyK2FXpBjXNO5vQOa5WIlOJU2x2BptR5vmZrrMie82hMsLlc+r
 Cv2ngK3o3U/Dly9X5o3cyGz3M5VI1xQ7gAU1qkvtV7xFxiN08SzJvgAcfgsFjof7jM+GnmH8cKv
 vYfMs0wMtDBo4/icPXluV9Jitr2BjZSzboqtmemp91i/eXmix6FT/fyD3HE+YW0eri7KYtg7Bqu
 +vm1/bLf1XB3RgA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: X4dG49g874Waj_S9dLitW84iXsOwBCDy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXyfe0+DP6XYhv
 AVyIbat9dAw6f47xGZwdSH1svowLW1ZtXstCiyBY4IDOIyP0Z6uJxjLihkCT76+q63SYwlrUE5c
 1IAAujtVmUOzCiccoWJvf4/6PC7MQ6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXy/ATYulmTpjI
 0ISPTEL6z2IfTQyZwtfUWdAqiP8O/2nizjnAsQLGLHd8MA3Pnzhe4meoSwPGBF8HjRtm3RazFmJ
 Y5GPPUDLiYaAbZFSrhPZ64cSp4QDO3E6vys28PdfOHVlHxoCThjI/GTsRpjnqeQU8qf7p2OSVIC
 KerBXmlZNhnlg9BaushiP9MXyMOKvc3+CyAQtD7Ex0VE0o+gl91WnGZ6DVKlrWNXpJSqNBuzRey
 bszma83AWy1lrk2qI/nmRePMli02czCoT/tsDlayjikBXrqNGzbo0jNcGNuEes1v4bZsZ/Yn9r8
 95OVclpmIo+Ahd1I4Yx5oogQ415KQp99WLdTY4n5nHEWCVAIf9QsVFfkZ0CbVKcrpP39sxxTl7b
 p++Fkwla4JTYwN4C1yXxMRoEV/+a4Wxa3ZkfHj2eCOFV2rIgqii1uZfg+Vgsd3aAkc19UDjEeCP
 ce58fNVoYo5R/no+1dA==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebe40 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZteHwOODggqzs_94cHsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: X4dG49g874Waj_S9dLitW84iXsOwBCDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          | 8 ++++++++
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
new file mode 100644
index 000000000000..1eb24d91c640
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";  
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
new file mode 100644
index 000000000000..94d9ae9d616c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace

-- 
2.53.0

