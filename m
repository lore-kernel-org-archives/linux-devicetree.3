Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9A3AE1A3
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936067; cv=none; b=MVghA5S7KEAGIAWDoU2Dve0ryj5la9EKocTjEYmh5TKC5ezb9i6vuWdpEV16s5Sp/Z6WAEVphx5wBF32efe3Sbu9aCvLR0WHpzOcZyIqZYfI3E/3pH4QshiJKlo5CKbYW6Co17K0x8NBHOjtnnFy1E+/2B03cxuo/Nw2bv+moGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936067; c=relaxed/simple;
	bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zx74wouN92QOEHdzjYm6kblrXgJGAwqcJkuiaccb5pRDoGqqdAs16T+CXtpyw5F6w8H0gz4PIVzDz8f3NjXYL01CzHMfMwiDCVEFMQy1GXMv+wJXpxNJyuW0yB+C8HDH2JWUNkYwaIJ5alqAv9dggpNqM8R3a6aN652A9To3I40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5s1MDBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoNV5EDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5s1MDBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoNV5EDP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgGLf1274611
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 06:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=; b=E5s1MDBEH1ON1ZsY
	nKqm1kTpj0vfKXp2qChPevX9/eJZE8PgdFhIgIHDa5Lwj5+V8S3iUQZOJr2jD+9n
	r0vXRa65bFOUB0cGnVZpgeeVK0bVH3cyDeP/WDVZ3laD5PWuFe1toukt5couE1OO
	z3TJcTzN3IVWiNKLP3nbwbMmqhJiAa7APIcSMQeAW7m1pfrR519c4ePaGuREpfVX
	rtsRQQCZody74mrd/3zN0Sj0jPvw7WtmVmuOKBleeiacZknP2zXQAj6VBhAUFo4Y
	zeamkdSUMeQRo+yIsl1LKlA12W7iNmqPympicQ967eDkk4Uew7t13fNejuwuTrWK
	zo9O9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2nq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:41:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso10006610a12.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936064; x=1789540864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=FoNV5EDPIBQcp6Vigki4z2l2tQLwfR8/WOQ+DHIKgertk7gtkM5zuEabtwIClkOMiI
         HufvYs7+LLCqGZbGIE9KyvoKZ9VNOWyf1t+l3LGDdzs0g3edobb3kH26Smm31BWgg+w7
         MFkkc4H+5pPWNtPV+y5Bn/ViUhwuL8pAs4RsVq/bhdrcmh8Xb+7OUs5gYkJQqrP198jE
         1tdGLAAxGNekIYeLUFwkyS5nrqkul6GPXigx5OnpoVG5R1Q+RkAwrSGE0OyxPxB9XWey
         6zaEQBbs83Tg8J4LBmXkvk/nRUROiiNWNu+Q3f9plltfTdTrp4iLLsIEXbf5ZBxzz9FV
         JKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936064; x=1789540864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=q0W44n5Wrl+WN+H/u01kqdguIo8LZVt6r/TF6QuG8TWNHTdN+HCqKPMJPaqsOK/A4b
         MnN02ZJh9IefKIHjAZbF/caPPl76QmI8BawIssUhMl4n8iaVMDxSkwXqQF99K0/1c+s8
         1CSGB5e5W5Hhyis6TsrmAOJR4Vv0HoOSWveMSy4yEjOJTJ6SFWMZHXOoWe/7SoaQFxlT
         PjnXFyTfVkWQWi5m3A3lvkdPZVtITackmqFDc3syCZXGwznofzv2PwUlr9mH53l+wUjS
         jPuiHpp9M0plkVlLS880bM1Xnzt5aq24nNZK3i0Fk62Fe3UWeT7SjuRBR22WRxGEwgLg
         fn8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMpWdPuqvBgkZIrzPQsAUEOpCpQ+KWtWbXIciNflpZZpqDW32x1ywjcaA52QtDyhQWPrnsnuTkIvLw@vger.kernel.org
X-Gm-Message-State: AFuF++kRhMYpgYVWt5AOVmcLiUcJoTpI55X7PAYel82l8CPwfs9/5rvp
	317TokjUTfp4+CxeBuO8jeRV2v9xjea+aNXApLxwPy1p7PkSW2F0pCyAJHmUB84i8iZZ/JbdAMy
	VuLdBRGlgHCbK2peUN81IqVX4Wr7Lqw2Daber9/uF5q7B4OkBVNLU/c76s+lXblnK
X-Gm-Gg: AYBFou3wouhGoeoJZa/EIfrBumiwwy76x91yb6S+fBQSD2Mh2GWr+39BtJd4zVaV12e
	B9XhTog+gOd80yCb4Oxgao8gGlQCTITzFEGjh1fniMFbHBwnARX5D1is9NWKaodKGVJm+k62fo6
	3+nAfG7eKyJVKbc9uZWhUi/mCtiaY9xcW2HsmI/ClxIb/godpsKH0UlyUuXCTHPvvEp2aTlar9I
	cThooDYOOih4OXKSvpXyLFjySq/8HtbEJI40LzHdCRfnEQvVhv9V3ip3ogSOwTXsEDozP9KtGIP
	CpMECbfLmgRsF7BtOnnHSh+uif37EcKWoOcxK70ZnFj28sejhKAPDqMa08z5dylTeA69WQTWCXS
	EqyPd0SzmHbmj6agO9zzC50BULLdjaYxbmmjnz/JgZAQOuhod8oVoxfrhHzO7RWsb
X-Received: by 2002:a05:6a21:3204:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3da3a0a910amr55767920637.17.1788936064242;
        Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3204:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3da3a0a910amr55767877637.17.1788936063865;
        Tue, 08 Sep 2026 23:41:03 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:41:03 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:40:53 -0700
Subject: [PATCH v3 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-qcb-v3-2-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=1007;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
 b=b49zJ4gwbfO+Zq9+Rnmm0Q+SstdvTLXhCOM6C3OI06W6x6Qy/gIhxyrzNFTw0pV4ffI+xhsCV
 x72kEen6hPCB+Q5UAxpibYa3F3ACnsuQYRkQ5MlJD3C+w0S22pJlG9+
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: lamK_ZNB8tckkwZIxaPqogxVk37nz67I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX47n0HsSHPk6U
 MJQZIBrKwbf/pfhBBpn64i+oe3/GgIXHecR2McNwCWVjVIMcB71DPZxR4V0dDYYErvOGHEN0p1v
 2hZltIycgt16w6dbyJ9NJW/mgf0MB28=
X-Proofpoint-GUID: lamK_ZNB8tckkwZIxaPqogxVk37nz67I
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0ff80 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX/w1Jo1hYJBsK
 qvq1GLpcWX4RGsDIfWkbPqtUZ+22ARkaMrlekXn0OfKiNo3RS9PEiANUDmJWlWz2Z6uhecig8JS
 bxwnrjtDstyZGlXZ5WKpRpnmfsdV/varNFjb6nUSBuBpOJQB45qLN9jovnnPibJYRMj+V2zr+t+
 kiCyFheTDmgQrYsTqUrxZsRLNVUldyziRZC1G2s4868fUCpHFv+suB8B3sWsoVCzIEBnEJ9QSlR
 AMZaREoKWNj2byQ3Fe2L6oQs2uvIt2YEUq9woTttUPCSxrx3lH10JqdRCGTjdhfPUo4vdcrMGI1
 Qk0V95rlX4rdwYM0Bh28rz7/PLsq+rimqfarPhsPVyRunUtlRdMwGQMsvlqnDKpwMFYyj7NfkiD
 Gn16q+o1y1ZjE64MvOmX9ftgv3Byi0+0iMzl2dxm3os+a7ka7NwEtwzpr+fdesqFAVx+MZN4uvS
 lwvXjx4/uMidiF1xQKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090073

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1

