Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F624BBEB
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717892; cv=none; b=XFMsbjicu0/ilWZXZQ+5FTy/MAGQ98e/btAD1GR08X65s95isMAAI9+dHSAWPcwWKu+czNHYc/LFyjOuOHpzVoTwAzGX7F9nP5cdXPYmdR8oz7f2Ej2bjVuLtK9B163lKh6JL7EmunfynrDeaJiYOTsAdLyvzJgi+ygKmgxoWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717892; c=relaxed/simple;
	bh=+ldQ0bVnolgc/n2gfVTrTuNaOvdjck9Vvn0jt1HvkFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyEPANmvmMmjKwBfK4QSGVvtCk1rY9Do0kw8SGVL/cR1IewizCIELy2c4aKr773AD7fqCWAzXFH3PWE3vxNA2eU1OkPSWISNr7Vn46UWKSJoAv3uGbgJSHoJZUSe4l0Yf5yfDAD9Tta7unTLiSz/EgFhcEfMCYoWDzXB9CBI8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9klIRs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jA9W8zCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9klIRs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA9W8zCr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686HmPN01603631
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 18:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0
	tpOvNbd8=; b=A9klIRs+tSA29oikMxoFXzh9QODErBLgTlnTzT+zjN4eOoJUDMu
	uP4rIO0dPCsAKPGheyzJ66P0OUmTRYisbZv/JrYR2OZXa2JRfqTx8K4sYLymXLTw
	kASazTlcRrj+lo+Ww3V77MKqhbswgczTfS8KR9lsS5TZtD9u+01HIHRSSAGaLsKc
	lhlgfXKu+b+0TD/Lm4xPxdDSWg64nZgdu8QDEbY2m5GDyEcbIY+GKQUrNlXirQxS
	Mnb7zBI9/c0DvwLYmh6TKd14YuM5I26xNyu0SYd8wFFgEs1Vw/dQiAvdHFM/yErC
	8kiEUT4zgeqrmkCMY9Pc+QQMRn1uem7INsA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkxym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 18:04:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7a3b3c06bso903514e0c.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788717889; x=1789322689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0tpOvNbd8=;
        b=jA9W8zCrbxSia++710siXscmt2HXnaVUALgW9YswTKmfpdEAGvbBbDQm/L34hHGiwu
         GbBffJ92FfzdZ7F4o43rsBnIuh+WZGplYLlZNqdQc+bdI8TdATnT8mDz4n6YtTTFay4c
         OklJ5z84BWx7kQuZ7zAXXQPfPfC8OoKRiPqGelt4YDN1tznObq5QUkzd7l5RKqp4ON0y
         TDqcnQmGzKaheEoAaLGfyC67ir5md5zjw1mzG07yiE88rwykU8tBw8YPHKPB3jgdNROk
         iy/tF6fVh47x4srV6IndXk0QIidmmaPlJxNw8/DCJZUFCeryvMm87u3uBrg2OS2fCI5e
         wZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717889; x=1789322689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0tpOvNbd8=;
        b=Q/fP/z9Pr45EgE6c+PE7wyF0pEThHvVUpcnqL7HtULAe325nQ+p+JAY44ECFH3FlBG
         KtiOWDqips120uN4So8FGBpgsZG8BokptmVXV+xpnE6u9dg6lxqsxjZsQKkAqHQLhBKO
         BOiFyHaycyPbX+z7aPyje8gXwmS0zMYjrp8qe8zPYwxHBr0KDFL9G6KggP3xTQgk6Z+l
         7LknsfQ0yu168H7SqlUjUMEgYkOLsAaYLiUpQlzOmiMl3E7DuOMZhlXFvh1gg4p37Cjf
         grM4WcTSsvZ7Y/io7I3LtPs3HsSBT0k461gfaKu6MME2NFrcMfULv9MKPEuOyZKI6BNT
         zZTg==
X-Forwarded-Encrypted: i=1; AKwUvBytzachsxv+/oYecM/m2Rl5xTU6ZDGZkoXZqFwedI3QnrDJd2tqU7IdloVSbHyICoERFNDz/4avnspg@vger.kernel.org
X-Gm-Message-State: AFuF++m71sc0jALh4rjVILR53QAbsGnMMaEf5rZgd6FZyJRZgXUh0g3i
	pVP3NHacmNp4fgC8BgnN4Gu55MnXedtb4wwCuxkZQV0QOY1ZziIqfd3fAmKI23mB2IYUfNxiIbj
	QsIkHYhpx8EYsXRMvCZSFTD7I6ntDEi3TDdLfbkemZX7KDwuG8BNXR706abshu751
X-Gm-Gg: AYBFou1nvEIeXLkB9lZWjD9fMRph0d99b4K+eW9A9cJVdRHXB83hJZeN60iROJXALHZ
	9LPwlWw24Xmgo6/hWaE3LO7MHzb358NYxmFl0yNAjunqyrG+za7DS0qdsim6rlJCaBuH4pUcN5G
	5c00wyc8Uoe+yDLYII8HsOBfZV6u0kjbsfk9oIrXQs0jS5WmodpX+A2WiofnH3tuX1in3frRgC2
	IwbzuLP4jt9jrcmdKBJTTwNWqRp/l8Mndw5WW/DhDb33+eukCwL4SWfdEWopUherynzsYOFoCY8
	mDSCoqJnwgkG3pUVKL1ncxzbIkd2BmGLENSk5WsQSzYds7b4+4WnjQ5YaqOWLogTlX1vyDZ4V9q
	g+ZZGKAdwjkBqvdY=
X-Received: by 2002:a05:6102:3ca8:b0:786:724a:4e94 with SMTP id ada2fe7eead31-78a4ab072f2mr5381546137.11.1788717888780;
        Sun, 06 Sep 2026 11:04:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3ca8:b0:786:724a:4e94 with SMTP id ada2fe7eead31-78a4ab072f2mr5381492137.11.1788717888351;
        Sun, 06 Sep 2026 11:04:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm316638975e9.3.2026.09.06.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:04:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] dtc: dt-check-style: Right strip whitespaces, leftovers before comments
Date: Sun,  6 Sep 2026 20:04:38 +0200
Message-ID: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+ldQ0bVnolgc/n2gfVTrTuNaOvdjck9Vvn0jt1HvkFE=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGqdqzWg3Jz3iFygITILkbPh9KEnlBPbjgies3myFqxXoOjwS
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqnas1AAoJEME3ZuaGi4PXkJQP/iEf
 vjv933DgA/mam448mfyhAHdYR379Ytv7KMza0j5m62O1Db8L78O25nyXVPsk3bJP/vEWWaWO9PC
 FFIgl1sf29I2SAJrKgFl5Kw9UrdvqUPsf7HJSLfKFbZfgx8moTFSqFJ6VGe2ne8FevbhUWyjfPy
 jiscBhe7p5tSUGNJqKgZ6Ec389wf6QlGuVDowJKi3MaplUtjh9r3Bt7QaiuPXz9Wlvslt7rOiGG
 NGiAf+wHhkIAF7gl6vKj/qAfH0ZpKZtBl5qoQzPSL/BiBPHGtBI+/Fg2WF9TMMGwUi0QuETSGLJ
 is3D395RlOOVuGiqzNp+k5k+cRa1mmwR0OliKj7aoZRzqkST5yVqAe7sMZINGbTGgAIqOwxUeCe
 9GTJcl90i5B8pCv0wC1bRVFiS5zdWu6Aoq2GjcdHqp8vEQD+qstAY9d7nzv1PuaZXJqyrkqHj+1
 gUqwrU6Fu73wagGAEO9Ra7Z+Sz43ddJ//uY3S33Th1VGF4/YFuMIxzL8fuL60pgZ0TJ8uyrZWB5
 CFZr7Y65+9EtOAD4Sc6Vu7tI8rc+kCjwy8fdobChj45IbcJqlOQMvl9DhI9Us+jzGCKt2TXaCui
 L8NeK12HKuy4yZtvJtHmj0USdovXkhTyEK8UlGY9NhJakAaqMsu7v5Xa9fuXEMKAW1iRHsZ/2Pl fLycv
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qEMmkTqcArfUNQHwGM5FCiKsZ-NfMbon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX9mw5dhRQwUHt
 KZkHtGX6HBpe7u2jBDD9wHS3e6UhCMkXDpDQysEbnFOabEXSS6GKHUCmTZwhBEApkb7rGqEPCVZ
 IKAOnSM9KW5l6aVUa6srUp0YUyyVtLzTLzWRrmVChnLwmIqzRqYepFcHOGv7VCvql3UUPASBVGg
 wHTeabLXBv28oAMUas9niUeDRLZMVIsXvSyIHPljB2ctW/r3aUdoDfPXYMiJ4M74k47Bd7m4rYR
 VCNs91taGII3gCv/RDdCDXXByBcUuCx0Uv9myNRtSbbLSthQuSzy+D8/vGbC7ELpXWaXriIiu7J
 J86GotEZLIgMUhhuXWn+OpG/3RFrnCw9ZIhu2MEfdp9LkG5XVeVh82bqi+sJ4B2ECKmDPeByPzH
 bOyBbwDGI9jCJoZW9IpWesN5N15B/Ps6BHs6jDGK1kXyaVXBiAOUxUjbof1h8lO/AXPKaYJmPjm
 3E7QF9sPype5pvELoGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX3qacTUyJJoEp
 pK8HIjbhtubsA5dQCS6LcDUHVcT2Cu26GSJYndTPw9y1dE2i9VGThA/3/xwLoGz5Rmwdq/aMmgU
 JTHsUD/du5JKHMao53KKN0YPoNv/NHI=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9dab41 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3nWb1Bopbj9nUPZVt68A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: qEMmkTqcArfUNQHwGM5FCiKsZ-NfMbon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060201

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 15a3ba82fd5f..dfa9d3687852 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []
-- 
2.53.0

