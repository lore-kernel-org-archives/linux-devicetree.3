Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F624401A04;
	Thu,  7 May 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164499; cv=none; b=APYi4zBNNxvvlq75MQJyjdnBbTWi+m1C3RZ2lozh9rgRpMpuh1XzRo4mlp+J7KliE9N8ExEfRzSQgZwteaU/F4gRs9ECmWuHP6a695+MueC7Sy8Krqj3MMr4dL74XvT3gkrR1PRL35I+w1a4/c2ZA3EVUat9/CUZ2bFdw1p94FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164499; c=relaxed/simple;
	bh=3v0LV4tMCHF+LKzcx+vog6tt18T1D7Oo+ve+qlz5oqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a1YsrUt5+1eAmbeUl2roOZUGLoOO9mrIeRFe0XRrw4sk6KMGgDwhOBRuplMAwqibV97noWYDgB4vkeHGySuIyZQnpbMI9uPNrL/tXgNbQtfncuH53XFI/14KnKa6YBah5EKfxEY2dxCGMMamBaD3i1KPPLdtgEnxQDg0J7cuUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1778164479tdb0a864a
X-QQ-Originating-IP: UhsvNPMO+jE0vvLytZhDhlpdQixHiTU+KLzalrSRWkM=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:34:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16566035196462123996
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sc8280xp: thermal zones fixes &
 additions
Date: Thu, 07 May 2026 22:34:34 +0800
Message-Id: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm1SGmSIVzEuhrFKjQ5kCoRAu
 LujLN/i/w1MkorBpdggyaymfcwoTwWEzsenoN6zgYlrOpNDCw03tAw4dpI+/o1rH8WQK1eFlsm
 XzkOOhyQPXf7j6+2wTe1Lwvi7wb5/AZe5rxh6AAAA
X-Change-ID: 20260507-sc8280xp-thermal-zones-2474cb20a17a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=sophon@radxa.com;
 h=from:subject:message-id; bh=3v0LV4tMCHF+LKzcx+vog6tt18T1D7Oo+ve+qlz5oqk=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fv3l6SwTMukuCSw5XbrzneZGZY0V69Z/FZ3hWrNF8
 uyagBSzjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABPxq2L4Ky6h8uCz5om1EuYL
 pvR7MZmc9nKYzaR+5arBevc1Wp+3WzH84b+5aoP510sHHq7ofMEVzDhnyjL+KRwdFxQ4dQ+/U2q
 25wAA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OGvgEoGelOUdMNlLDAf5La+OPqFoz63xyCpx1XP+ovSRwguG8cgYA1Bj
	E2Efa35N1270jZ+GiDOG5vsTq2a7gfyOQF3OBwjterpXlqC8TsnjsAA8vQD19F6C+69ribT
	OfpJMuJ1LaTixjIsVv5qZ34pLR77WI2szq09+cFMetHGEP/xI/Hc31Xvu6BG0EFEXDnxCE0
	N2aVmw8bqMlaTb8Zohhxp1lEzH2Kjb/o4WPcaMMx1H0TpgXUIupOWKdWzSI0+X5NTQUqpGY
	b51YfYLA/w28sZAE7cT4uwuAxAox9Rz2CHHQFvwHMbIiD6PB571y2l4gD/zJbq+c+H0L+0s
	f5AfX5nmn0WrPz7Fk2sQ+jb+/Ba8/YoJ65/kV66Dmnm/JBFRFfkWX5lXfRpG8eRCjFYofMK
	7TNQ0duTJCNtKnCo74T93AyrnJjIcT5IMRPMHomGT8R7fLmSGWQC+MO4+cWzE0OcF3TFFjD
	+heBkHhTyGS45UBQMdG9nvBFdejXpHE469WPIumVW0DoP0+UBW2p73TB578xbc/DwN4YuMN
	+xFfVa47dl54gPOldS6zPRTT8Mul2PNTOHMdVJVxhSsZnql5/QjbBWOg3ocLsiPgqr5VVn+
	EkwAsKn3FQb2LHmd3DqBMInoitWdGoyS0NsNTPCUmzJx5MV81FG8NROAZB/DuwJL//npKUS
	qM6VP0rNARtBbOh+WxaJarbXWpYMkb72MdRP0hoG6GIDt8NZHmp/ctIsXGpa5zjbrBX/Bt5
	MFHsgMfTFSZ61jvUSQMfdCvb1t25OatjpSFc7fbI6jxuUSExq4YxONM3JLbQ0MT+yet5W1e
	2IHA9SZ8fJPhNA9xiAsbTZgOQ0aCXYbilfPGCPeY3bywfXIrgtDgUBI08QyK/b1eUF65dGk
	5ErrFk63Re0eYkgo2qJqv/JyAyZtNyG8y/SCwslRQwMXQBUBCNfXnGOvIMQeFdNodp0cV77
	b8nUG7OACFSooNYDUAT5oLk+F9ghMt9fldipbbxnljT+691g8O2NEAB7du24oSwhONT78qK
	UxkoLnHKjiAR5yvrEAb0cUba8fiun7LIBaUYjHagOWikzF9Y1HZPgThX3/8JV/+kpeiqs0k
	g==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The polling-delay-passive properties are unneeded, remove them. And the
SC8280XP contains a lot of TSENS sensors which are not yet described.
Add the thermal zones for them.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: drop unused polling-delay-passive properties
      arm64: dts: qcom: sc8280xp: Add more thermal zones

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 527 +++++++++++++++++++++++++++++++--
 1 file changed, 498 insertions(+), 29 deletions(-)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-sc8280xp-thermal-zones-2474cb20a17a

Best regards,
--  
Xilin Wu <sophon@radxa.com>

