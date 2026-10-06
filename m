Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18BF3E009C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282380; cv=none; b=Nn3yvNG7PlSiohW/+mCvxe/tJRoZ2GoAvOQMQET1mfu+pQNt49AydNOsbusZKDI+IS725PTf8aS1p5gi9AbOdVA5o6dvnN9LBgJE5/a+wgMlKnywryyiD/tsjHGOs5gWL6kkIgq0mHLnQZC2aNVqtEI0qSG6KTgOZjo0VhbaRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282380; c=relaxed/simple;
	bh=Bgtu1G/xKsT1poLg0m9/dTlyXn/OoGnutYJksLEo250=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VKmXtGVmZWmnFJQ85VM+fvGIuuJnO+JvPIACtXeFJ/LRefrYOGSeuyn5jrKCsJ0dtcxUBu2aY6QkJIjg5DWpR7hFWrL2Tzbk+86lD4+Xo0z1lltCudFqt5P9FzTDDSvawq52fJea8vQ0PpZG26tFi7EKCZb3CMw8ffLZ7CNSgks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXqE1E4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBVCPGBb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXqE1E4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBVCPGBb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A56Si871135
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 10:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PpJmWjeWUD+Hl6NsU9Ms6A
	ZsYY2nv+kkxy5+VkQkbmI=; b=MXqE1E4YJNC4vv5qnakLepc78Bd6hIl7/E9nvA
	lyFaEm8WWAFFUxSP4d4dyJDv2VjpcIsVLAjK4gl6wYLlLKhNIs9i8rLm0/WdXOiO
	Xch5gOH7BQZACj1er9oURJOMIhWK6JyMxz64oQB3bLE5h+uYMyLKME9pNbwoCDLe
	63MCpmatgJJ6JWuum5LhkRl1GCqBxxU4cJB70eE2c7Rldedacf+hkCPM1VGHNT3q
	8SfmX2j6AhrgH+eVFe33FrcW8nQvdYLb72mpp3h52/saJa49NDYsz44j5WGHkOgU
	kQzGPywlPv6nODeFtUOeEd87S5m0iD1qDDgz+jC0GqDjMu8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbg5yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 10:26:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a85a221b7bso1057069a91.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791282375; x=1791887175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpJmWjeWUD+Hl6NsU9Ms6AZsYY2nv+kkxy5+VkQkbmI=;
        b=dBVCPGBbGW/SwU11H143EZM0II2ONKq3ILKaiTJspvrQfaLtdplitxPBNGcjIsS3XQ
         nwMHYXzkXZ4GyOurXDChXh98HY8UL8puJJRfSqqqgg8V42Y+rct+aRni56tr8pYkeFOu
         +wDy5+urUI+pPP64q6NC1U31jeAF4WRzF7tBs7X9xjxZumTBBnUoIggNBMD9mx0p/tHh
         v27cHgW73Yg/I5FIddumPOtoxSKvA4awe0CwfLHYfJgv8w/i2qIZtpy71NSzcGLqAa9l
         cFo0JkP1eToFCTpxR/sEZCwq8RsSvWdpdJoyWSUQ8hSDzf1HdpJg4s6S1AwPstImstOe
         qzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282375; x=1791887175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpJmWjeWUD+Hl6NsU9Ms6AZsYY2nv+kkxy5+VkQkbmI=;
        b=Bup7kf0MF7T5I0XT5l38uDdIzXDU8ySCjJsyDLgBCuqSljqYge/+//UcDbL8UrTT9w
         uu8B3J448p3eubE897p5YY3K2cv0t7sbsnJ/9WW9Y0kGQULGYucMZPH6Aw485WFyo7X3
         1FzT12rxsh9QfONkzkyH7azkSa4rS0r6ewQ1FRKk3AiC9ZB4IwyVM+hthxDk2MNlXuKa
         OV2zudAWvMDBucjItSyIFOOYVGty9RAN2IsfeC4+7HJoc/ygXwixn50mhgbWES7eKpOc
         LFu+QtrKOu8VAAOq1uGC7tmqssAkWe8iXZeDltkZclqMcE+HC17oOoM2nGXKUNM+qZyk
         qiZA==
X-Forwarded-Encrypted: i=1; AKwUvBwbI//IHVeNHlFKXIYdq3BhJYu0P+uJfAex3PqoWGAHex6eyRrCNa8mtml4b+f6e5Nhgd7AHyHexvLJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIxQqfAr1+AZZMFMAAMRVKHIp2FdtESkGRwjzwX1XTP3Z/ai8ww
	SDxPst2n+Zy7fupFba9tBChJWj+D0cF19D9FCrA9GKddjLPnW8qvZoZmm1BBc9GFvrfL+mEeESz
	IXGrz6RbJVnL5Qbx9dv18f3XrnsYgy79XUdwpCu+PT12YXfnnGhSEOOhx7mO5Fd0c
X-Gm-Gg: AYBFou0iKu4rtPBJj/qOIw8vJD3Pg+OmCeXLK97Gl63+2AmqO1AO5ymjSTRGP9R3wan
	BvVXRQVKPMNsxvKPZA0oZi+faTfdH1hESNhfG7fqF5aityMCg53J0VvYe98zjYfgsGWdb1Pk0HB
	hzaWVz4hk2AuzJSH+zXQy8LuUHhS9YhCkZROoH8fMKGjHwaWOxQgCjtW1JR+ILq9BH0EVQfG5QF
	A1JOj0EXhibG3PAuIL2o9GlKwLnSmyDebby2BzUREPYJ+wHUgV6tGposBhBfB1xIC1yPVYChwPK
	RFYg4yHy+Kh8pLOIIUSxksMfXNKv2F1w+tkG6HbiqbuamaeNlEku69h3KIfH2PVncaiLwcgUs0B
	jIck0a34Idt7ovjYXX8vBu4REuDKGZ4U=
X-Received: by 2002:a17:90b:5623:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8736cd466mr668283a91.35.1791282374737;
        Tue, 06 Oct 2026 03:26:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5623:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8736cd466mr668213a91.35.1791282374259;
        Tue, 06 Oct 2026 03:26:14 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm4088289a91.5.2026.10.06.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:26:13 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Tue, 06 Oct 2026 15:56:05 +0530
Message-Id: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3MxGoC/3XM0QqCMBQG4FeRXTfZjrpaV71HdLG5kw7U1aYjE
 d+96VVEceDA/8P/LSSgtxjIOVuIx2iDdUMKxSEjdauGBqk1KRNgIJgEoE0395OnZrzbFxUFLys
 QutQMSJo8PKZ65663lFsbRufnXY98a/9AkdN0lTRKaIZo5MWFkD8n1dWu7/P0yOZF+DSKLwOSo
 UrNJZyQ1Uf4Yazr+gaf0MKd8wAAAA==
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791282367; l=1637;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Bgtu1G/xKsT1poLg0m9/dTlyXn/OoGnutYJksLEo250=;
 b=ReUh1Z/fMl/E8ea/pc8f0LBd5t/4CDU32Z4x0O0CfmVerzz1p8xzdkcVhGP42K+qH6JBbFpIA
 PBaulU2cVkDCZi3hQw32ob7LIrhQ7Y7xCXjXn4lRNRY3IxTBFm8cq0M
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4ccc7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p04a6VuR7GaqaFzguDYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9WRWKVgBYTZYNjv54UtXAr2Lgn0JXlkt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX6GIDtuLlg22u
 70IpfvdC2ET55DU1td/E4moUWZkW29oS9IUIzTioAeBRGCYjorihpRTPWPHL8G4nc4rT522SjQH
 x51dA4w9ATrLo9RJfpenEvgnn3Be0xQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX9pkaiKPCGIo9
 xs/5Pd22Hv6D+M5KUsLABi6P3XqQ/nez7n4lAIiI+JRXrln3pwksBvnAe3hKx8PmpC21rhHrqf6
 fGzg+kal0QO1a40K+KGdnwws8DRZ1OmnFa7HnIYiE82JKJK6XSyniqZuU4C1MvL/pRiUiV3SjaG
 8UQ4/vodmSVNZEEmPYMGAuyog5b2jbRWtHc77EQc8qFyNRVI1ao5qXnpeYKUGbcjhtcBXqQdb1j
 yUqzmB8k6hjtyVib4SMwRVt7Nt4zLSUW55Dti/0MISmV6Ty9SY+/YJGnTh6eYYsxBS7DBzLnhll
 iNFgMUkj6jUvlk958eGuwH8vaL4UAKd/k9ZV1aUu4kbHdeMzl5nWKiy8L6a6QwwZT0KUXUfati5
 /YxaNLA7PBQc8noCi3yFZf/7vCkFJriEqjaluuVrEXe1VlsFPvHgaHpHE0svYje8O2Uk48KfqmB
 npwEzSLIomWMBuZrE6g==
X-Proofpoint-ORIG-GUID: 9WRWKVgBYTZYNjv54UtXAr2Lgn0JXlkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060041

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

