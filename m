Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6F3A8743
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542330; cv=none; b=fS5+fbNBRGDEvf3l0DMuvLTpQ8KdAzcy1paPFv3betXmNZUvgy79yZcFXfrMEhrghKsHZeRrTa/rsIiOu26X29AvwZ+AWtEFuzD0xjP7B4+rBjkZV/lWvntDlkgRbS1CXDxjA/PKiHxd95ZgUQEl3p3RX5h4U3EmJ1GZjEHlhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542330; c=relaxed/simple;
	bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A47vJt+XuEczam06Jc0E5cibU9ItdNqfovw3gQWlqF1fxdWKfpS+wznLEZSJ7ttMlvcG/8cSD5B/dBjhcAV7QEbh1jtwI20/aTC+GyKmUhEPK7AVHxjbLZMwU0uCj6fPAKvIiCop4YSCnt7lqByT8Zlpg+fi0dF7Isstg6BJ8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o27+erCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqEFSrbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o27+erCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqEFSrbL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59KGC2907552
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4TR2hgyAocOg4yzQctMkNu
	sg9NkxK78eVFH3lHgb/5w=; b=o27+erCAndnK2hEKBhLlyBKmatx0d96B24gbjY
	t4/cDO7tBJJ2zx1QbL4Bomv8TYrDeJAJBsIfWfBfubSxsQqasuEej0QQMTeTfIon
	4iyby+xzvMX029c7d9phVB2ZZi26Xbl0J49Ec0u7pt0NCtZmujP0SLAcKQEmdPA/
	TEKxF8GySeknQnzAwMzyDnE8HpyMae3JKLVfVOUKsPWg9od9ljg5xuIgmLrGP2hR
	UvqihgX7YURwicl3YDjrI6FuK4ed5U1rwLzPeV9mnyO69WdbhvA6qFWtv40SnQ0/
	/DESxDu/WojAY6o8WgxmkeTPoEhP2/Gf77ll18eXzkoz4JUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf91d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so793715a91.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542318; x=1778147118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=SqEFSrbLuYgd4WoagpYGvU1BhxyxzQ46Tn0NcqFsqrmd2sweRBAeRggQ5sRIa1qcpK
         Zb+NCJ959dgkk2igZ6S21J/vxnykucesQNjaPCYdIpYMgzgsxEZQcZ3uDTgWuRG4w6M3
         pb+we836HEG0zUoh3VNTqgu/i+GHqs4OalCwzXhjXyEcGx0UN+YCgfrjvCmwQDG0zvIG
         EDzcHY2Bntaik9I7gfosHxNndQt3PDDxVL1ALdSh5YaXTGIQcATSVOoayrK2uTmukbcJ
         3+jjPwqUDmbW8jxSLnmZffnLLBktLs1z7hKDXSX/5aQttI5xCydaRZjDhQSOMMUYyvPH
         ABqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542318; x=1778147118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=fnHnyqVbr9EDjAFeWCIjK7bSlg/JkeRFNgjkr62yED0sdKDov4p/vE39dnqy/GAVLb
         8GjYFO1fdcBM15a2PQzHjPq5e6ifkaiPbBCKUS5pJ6y2wqELiBz/OxK9qoaP1tzvMsN9
         8nGSo/9R9pnhsUvpFxCa3yJ9CISI/n2WPVTzJeDSwShn4Qvw24PGHjnGJ3Bj0qCwkz8G
         m3ueupghIIlDbFSs6mcK6n6wzFkhIW/60b7MIzczwXQMorYVvLGm6BrVDu0sQPX9iycd
         SZ6JOgKkNp26/1yCRzU5eligAq2Nx3zZ0jdw7hm5gN0B+DeDZqseAdd73QtxrBBu8g4A
         TuQw==
X-Forwarded-Encrypted: i=1; AFNElJ9nzxKYKbdA73EaLGqL1+ZasUrS4msDFXQW/VuM+u6fdJQmipvwnYhSGd99DgUHJt7E5ViVnhbHTDzT@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1eraY/fKPLRGFyT8jMehhbyVjt9EXiRCzZM68uj9BqVIgKGU
	F2vO51bPqJj3MPwWqEVPo9xE8umbtikwbmM78Ykl01pq6Ybixam8ZOk65xDBweoHxScgcc3kNaM
	SKBD8PvnegYszgignqEc2ULZOK/EgnK8ScxOWkqD0Zq89aL47d8ctb7mbTFPQZlaY
X-Gm-Gg: AeBDiesp1AvW+zcimkmI4xjGnJ5UxOFvcHrx1qZ3q9oPTYmbV+EifI/YNSptvKD6BVl
	SFLr3GZa2AuHLCUXgdESDN0ciXWCOL+Kmk8M6TiMRWJnTaIuToGuuf2Lq4aXoLl+arPsznMVX46
	QsmmMnq08G8glRHaLc154t1YeI80H9PBk5PU1n5l/jUROkm7EJFTqKI7XaqY8ht3/HXpNUvbcHF
	fEZqEZu56rCN8KEOHIdDCDTbYvvHn/sM6a+RPsEoaJ7BB7SNgBidOyb0zynCGQx79bmQ1aEKEQl
	cfO/lmsMJi7h8iijK+pzIfILNBflmQneyJZdQl1qlp//aEMDt/+LLnqPNHt2nrwFV+QYCFCvFB1
	3AloBZUesXY6pqSOzwvBZDrIyUL1HKS+1Klxnzy54YiMIjf8jRBKtjSrIuwKFYw==
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276414637.6.1777542317983;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276369637.6.1777542317503;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/4] Add compatible strings for RPM and mailbox devices for
 Shikra
Date: Thu, 30 Apr 2026 15:14:55 +0530
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgk82kC/yWNQQqDMBAAvyJ7biBGidWvlBJSs9GlGmUXiiD5u
 6EeB4aZEwSZUGCoTmD8kdCWCtSPCsbZpwkVhcJgtLG6bbSSmb7s3epp+WyH8yk43ld3y6JMwC7
 iE3vbRiiRnTHS8R+83jlf4FhfEHAAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1064;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
 b=bXmnJ9DHIsHnIm26jNvNfk9q947qAJ1hmfMnNurpjTGwu7H0uRkVYrrDJD/2L0pPmUU2bx9W5
 buPJQxyUeGGC12+He8bZLBKSjZomkXxnQThOZAyV3O6kqXD/8SO46yt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX/lOTnki9MauN
 7cu40DgLzqDP1eh3lAqG9BdGBCX+ZZwi2K7YWBH7vTbo46/t6L5Z75/GJWN2wmYl6ejqy9ABRn8
 +lvSCMdYxIsfUY0eZErpFopwTCkE+qjTyj9FWzvZYbmfquRXvat0k3dExgEO+frTlESsFfI9Ma1
 xyg9h9xqNlvuebyYJ67kIU8Q3sXuteY7AjR3TYQ4z+uEfdFbIzLh9goZB6WeaGIsnEuNiRORM1n
 vSe3+B663tvNNdxyNdb+2Fm+qFpg7pEN7dIn2CR6ie3yKTPzQOEvDWgS1fnzn6VC5+VofF67slO
 amZMMNzY527uIV5F8GT0rFF84DWK5ixuwPB87UKoVlevMYm/HrHuJJ/BgVwxQdO5LY63wJKjzep
 fkD0/+edm3eSOtsNYHcp9ADyZlrNaLuZPRzdEPb4wbMZnJmVlq5azXRb2V4HsEfnNkHpgdJMmJo
 rQeXnAonuq9RUSZRCAw==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f324b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uBlMio7ATwZ2gquqljnELn2bP_h7iDB3
X-Proofpoint-GUID: uBlMio7ATwZ2gquqljnELn2bP_h7iDB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 5 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

