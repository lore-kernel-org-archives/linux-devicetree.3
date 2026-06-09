Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709CA2C15BB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001361; cv=none; b=KdDP4fL1tf9xfSAqcKxpDsbMe1MmY1NvNOxUZ8Vl7RGtUCCECTjMXDmX1qTY34ECNa+srk6C0DHc8iXv0X7OicYiRCy7QZwU+pNV39LVd6Dgwk4veRcV2SctxoHWC5eINaV77vmJbsPkrhG9XKfAIP/6+d2C6oOGpIkuPnkAzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001361; c=relaxed/simple;
	bh=ILe3NZJpWqohU/bFMefTHlRTCzeanmNE3PBxYUChEbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVZIjpdyfL2lPx/BnohPaTzpO/bj0JIEW80Iblki4AczuOviu/83ldqQsGrW8nRTr+DX3vcuyIW3lXLWV8Ivxdy8McIz2M8THDpxkveiQZJMdPfWlSfaQiTdfQKyXrygjziYYKkWbaO3VeuvCAnSeh8d0teUls8FuG0aC3yExRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+5Zy0hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBvg17GA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+5Zy0hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBvg17GA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vQKs1867945
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 10:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MBi71NH5RRu47O2/eQxYkNP7Pw/uSJu4m6W
	i9I+lMR4=; b=i+5Zy0hNjI+yZ6t/l0509q17wBcoRKDMuh53Vl6p47ngFc1j7IH
	bV7NEGvLmsfKEBeCzSF3Mim+634b9DYAsvvrTCQ0tBiaKRg6uR7jbCyxNQA+knVR
	bH7X6RvANoKdu2OhF17+rKuOHxDsBSUjB0LXD58e8OvJV18VA2GLSbF1B3CHuvRs
	j9j7pvDawr3ss6Nko1iwo1TzOHXeCOTMdAme/crYypSbgYTGO3izDD5/vUiGEABI
	iHodLRkPzutt5JQYJ75pYqIn9lkdStmrkt5O+aCY36GWHgAj0UaPJKp20YSwauLj
	CIrchlkVV+qYMpFzDbotf1wAtgpU9VMuhdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdees20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:35:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517c65e497eso21097221cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781001359; x=1781606159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBi71NH5RRu47O2/eQxYkNP7Pw/uSJu4m6Wi9I+lMR4=;
        b=OBvg17GA9T+TDcv/NlHpBED4SESlSu0pxPWesPOemVnrB0k7IRZNov44Py+4RddyjW
         lyA+kI843/5wY4E/jfJDmOAFuhCBYJDTAtoVzoydVNEU/BA2g5HMycEpDZBSf8+IQ/ql
         F1/p94E4CiTos4ysjDt6BvfqkHIChw7T7pF+uK1wmUHGpEpb4FAgH3VpyAkdlx/h3xgp
         xL/dOJvTf4tvECOqt6/NzkXOTep76ztQxh16Q18RzJuzQHqQ1srrQxYtdBwuSv2PTPNe
         C0kZWUgZk9zNkU8xkwTZSj9TqTF48Q3bXMJLwva0T644w1bS40vjvOxd8LcBghvwK/mK
         kgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001359; x=1781606159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBi71NH5RRu47O2/eQxYkNP7Pw/uSJu4m6Wi9I+lMR4=;
        b=J42wEVZFTNMHxGlWzIpKtc5dAPONzs3hxwzWOIM5qXOqdiydyG1XMJNxTC/tVqcy6q
         +jtSu3KqbwpTk80Yum2bRa2wX+hq2FI94oVRwokanGjKGujQOwmkGz4C3tteLePJhbHO
         KEJjRXZ2ZD++RXCLOwSbPBXMocZWbLkT6qsBASzD4W7XjCG3DYaIU9DjctFPya9oRgrF
         mGUMckYuuwUqo7R0lr8PcJlg8wE9bzu+nVHhGtl/mODlvYukFk2fSseqfitDUuXRiO3F
         hQpC3+i8Z0TybdnLljAcIIKM94wplcHNFvbV9thJ6HC7HLbSHCFoVKA0CqNnAlYQVJQw
         YCOg==
X-Forwarded-Encrypted: i=1; AFNElJ+lCb5uCbsjou8sQyeJEHDEC9CFNHZM2Msi5n6kGXLtNkNCtrrHDQh3ki29wa/lwl/y7aN6OW5Fpk9p@vger.kernel.org
X-Gm-Message-State: AOJu0YyJiy9yTuEYz0/fu9zTRb5mV310G3ZZT94tW/dKx2XE9kMs1wBB
	ho2UNgnYPCVuqs2KKi2FHhAQt21eEfDbxHU67phQ1x8Qw/f9JqCM0P5rb4GoaY5R6vvSt/YY28y
	w43qRH5xXsX51ZqXacitXQrOsSDwt6Z4e0ZV37/EjcNKDrEiIQFB+tPamL4+WaN6T
X-Gm-Gg: Acq92OE56rsomIQ4ECsSQP1JwmUr/4HN8AES5NNXtt8wl7GSbbS5LX5FzCAYU9gM+mz
	kNpqeG9ipTASp6D2Ml25L3ujI2XVCj4+3UByGHAvt2bgO2vD/fDN1Exntoi+WFcgTc9SobrO3s8
	n/daxJ25YdpVzTGc5NIyHaoPvsb4VDWyprsfwQ5bap09vby4Qowa6jtvOXMAWIfwaFdy4/Eo2gw
	iDkklUkf147178Mu+hjxtSGmV8x3McT1XjQJ0qHOhg614JSj8u2FT6EqkpUUm8myaB5KRx+slVm
	2I6H8vBS9+Hao7NfplCOmMQBHLvythYEQiVb8Zf9IIC3v94HOoZx2UbkpKY+o4wChHEEnYP85n6
	EZ6om/wq6A6Di2vAM2z+NGvzSX52UbeUXQ1B5zy+LUPn33JY=
X-Received: by 2002:a05:622a:40cb:b0:516:e152:7a59 with SMTP id d75a77b69052e-517ca5faa20mr30928601cf.42.1781001358716;
        Tue, 09 Jun 2026 03:35:58 -0700 (PDT)
X-Received: by 2002:a05:622a:40cb:b0:516:e152:7a59 with SMTP id d75a77b69052e-517ca5faa20mr30928281cf.42.1781001358256;
        Tue, 09 Jun 2026 03:35:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm414164515e9.4.2026.06.09.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:35:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: dt: writing-schema: Clarify what is required in a schema
Date: Tue,  9 Jun 2026 12:35:51 +0200
Message-ID: <20260609103550.234472-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ILe3NZJpWqohU/bFMefTHlRTCzeanmNE3PBxYUChEbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJ+yG7pQpQBlg+ue8MC2H+l/gUcwkXa7FYRZgZ
 gjDRRukQeuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaifshgAKCRDBN2bmhouD
 14O+D/9BetlkX3iTCa/pWznXFmbODaQ4RRf73iNqVl3NdVAsqfwVDE6oozx3GoyPYmNnZA9YPNS
 A2BbrY1VvXd9SknSfAtHyaa1ooBFNCa160gxjttQgUVWASuzX1W/B1hJWUgNkSBmJhPAD3EGFPn
 gm708aNbbTx6cXfVXDvqeLHOLEUp+GKFe2pHHM39T1yDK8IXgOFMVSBA81tPixvXHrwmzrd67N3
 A8FmBNbIr/eoh4T/vFFhNl9UXG8vh9FpNrtF8KkJaXrLg4bze/o7GNwD47oH7r/kV+PaQjhW7P6
 wyw388CSWUP6nLVdM8ctuCexRMjuWG1QyrKwhmjoGHLZBnGJkwsqi45SwlvDLUYXqnoH5uZHyQq
 k0NE0WS6Dbq04IsAGjJdBnkAksVrPJ+EAZ0M4eoEF39i6cqP2KQAtoW22rfa4uU4w4CyUsMEw/U
 aRE4yNhnsqsPow2dmW3p0sIiS79QUh5EjZvk/bNzi3tYY80+ffGIRKQPuyJU4iywyOpJq/I3Vsv
 gRLjX/ap6+OVIqRfOXKYu1erbo4JzhgyVVlhwepe+Tu/UA6KZYcEiA1q84gHdy9aG6nWiziR9Xj
 F78n+4UdUBXAGmmRJbCiHmOgq0nk0+l7n73NO8sqxPN/UCuGJUbFA7t4QXvSnPvxNbXBk/n03LY JNE8ZUq89csnSAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27ec8f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=obRp-FR08QNKig9uGsUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5OSBTYWx0ZWRfXwmSQKiBMeVdc
 6MIOR/67hAhKQAXCWaMLbIa/p3yfdiB2ovEYD5GM1RPQJBqWT12zzCSkPZ4wCwVps7a7nohKYQG
 Sw5Yu5+BmwPDLTRZe7F1r+zyC2noeRx9pwUSu7s5xmNvwSTHFmr+dxRw6S5plzLXe6WfczjdJXf
 y03jZWBb9oLupyEvMs2MznwwLGTDld1cDzQbTF0V31macv3IMis0yFAogDj0SUsYx3jT5Rx7DWw
 EhbkQk26U4UTPU9eaF16e0kYRb2SCNZS6vys92YMADWqsxkYKbE/c9dA70KG+NA/JwPBpn1tioN
 t4jV378gFCsfukCYhKn25Hs87lhw1O43hJ1c9StD6dkBza9qqb7s21fYuwXvGwDcjgTPgboS5jN
 ueAIlI15X4iQVQRlZUMUQSl/EdNJoMCJPY7WC9P7ilbjqHuh9Y2PPU3xAaF6fXQWQTXh95gocZy
 c6gxobH9MtOhMImzS3g==
X-Proofpoint-ORIG-GUID: S9VWvNmFWsukiwtz-dZb_u_elHzEX4e-
X-Proofpoint-GUID: S9VWvNmFWsukiwtz-dZb_u_elHzEX4e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090099

Clarify that we do not require all properties from a binding, but above
schema keywords/properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/writing-schema.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 2ff5b0565a31..3ffd0828617a 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -132,7 +132,7 @@ examples
   provider binding, other nodes referenced by phandle.
   Note: YAML doesn't allow leading tabs, so spaces must be used instead.
 
-Unless noted otherwise, all properties are required.
+Unless noted otherwise, all above schema properties are required.
 
 Property Schema
 ---------------
-- 
2.53.0

