Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2333EB06
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715695; cv=none; b=RKsGn2VHWQb5F9w3LGJ11Fc6uMaOuqQsCdDrkG0zp3OJseBGyjYiUs5plmOCt8yqjpWUOFIhnyOuK6IaTMh4YPftLde+zF/3+vNXojX8tcc1ZG3CFj+BCy09UbYbdfKPLeHhAnrhUnv0Ex8j6dpkupxefxMO2cZapQQHXhHdTXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715695; c=relaxed/simple;
	bh=yKAoT+km8Ld0aGDl7IvJTU1MS3bYbIRRbUIueCAinu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jEQm495JFqe7uVGRyLDhYlcVLp9L0Ifp4v3eK+pGP4Y2bUnmh1CEV4u87ae1Pjq+Zs/7MdVNC/4gmp/Sf4J6tW3AinUWH/KbKZbQ6qeREg9XU1DdwwL+JHGYRFOtXxYPN5tBqIi725TOi9SKZS510UJL62e8o5i2elMq8CjMUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnPKRdmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iR79gP9q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NnPKRdmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iR79gP9q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOVM1730092
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ElqLYWeKhZzjaYdaSuKi9s
	AgcTer/f8b5SbaLucRmaQ=; b=NnPKRdmCht5kyd9rEBh6zRpgbh9H0v+a3ZA8g3
	OqH+kDx2nj12tlRDiHyaFJj/2n999At+ZkZKdLjGEholoTeOeZNGSHAoIi0YCMV7
	YgYeotGqC5SZsWInKjiwZrIhtznJPt7WUnRlrSad/AIUi/EhciDkcft0mdRJ89zk
	Y/u/tT0YSYwCJNezckqtnQewxgqmtqQnvr9FZzHfrGGuXmEik39ekOdjjZVMqIX7
	LcDrjY8zXDN00iK+JKjm0T2HKogBBXfFQjuHQxP/qU1CNSHbWCSs2qxcHo87i+9+
	sOWKsxoYfilH2rBic43AqM5HCjXLlsE80s2FCLO2FCDbklSw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vxug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:48:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c95b0e22aso11165594eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715692; x=1783320492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElqLYWeKhZzjaYdaSuKi9sAgcTer/f8b5SbaLucRmaQ=;
        b=iR79gP9qjyaq3FmUwQdqgqJ1L2WCC6Ilb20GX7OM18foe2n6c136L6ZA3NR3OXBxOh
         b0wRDFSrKxfrKmR++cj2SyOmySLffs07Gy/hivkwtWTS7Z08Kf8K0iADEbSfGoJ/oTE3
         P1QPJsJDDfv9Hr9JL7C9tjaI/CwWUtfgFFC1DH1RzZ8PJntJTV4YrKAjhoF0h24k63oV
         KHnbKBhYlxTAfhhaCVJYjeHsDMbfCn5hxz7OqPbVx0fHgJEddiZ5YvyKMRiy6El66Le6
         AGB+jz3aKiC3IjHOlPOPU1P/4w/2IHDTsNMN9huYlRG64b/p4DHOWB4jjaQ0whm/Zu04
         EXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715692; x=1783320492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElqLYWeKhZzjaYdaSuKi9sAgcTer/f8b5SbaLucRmaQ=;
        b=ouBmZn0VL9MeItQth+6KNtIN1vCsLiPdNVq6oLl1r+NvOZGFiS7fp3nBjK55ovYALU
         EyibXwvTO+7M0QoEKml60jHtK4pu377FacOJtAM0h1ZvXeeI5b44gll17Zp158RGv9j1
         4Ek3ErRZEtyj69YrutmqbstNFaZheenv8vNvCoJHavnMdO08w8ULVkVY+ADFhfLnqdbC
         hqw3EsjK+9150J2XVBqhqpUi23NCe/0csUxBRGNU4JpA1jg96ehdi1MUgPNqAaMP0l+5
         D2BOBLv32WHq8hPUNwCABRba5prfgfiMJcxZtct0ptzvqYquehh8zefQCH5tcBN4+0TR
         NyRg==
X-Forwarded-Encrypted: i=1; AHgh+RoryU8y9l0bOZm9i/z9AOuR84k1IO2qpQJy5yxm2Atj88Vo2NvIiEJGsoI7tQor2sWDO9m15v2y+uXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQs+phpIwc4Wktmw+ixpvyqWesi7R/nEwq+7ecUotUfCZwioY
	a3iSDFMskoAKoETgUQ+B2Xoke4wmdqSCudUeOvJrrVJUti0ds6PB289xingL7oi/jNpVADITXh+
	iag8VLylalZk3FKR1GQ+ULp4zJ3MeLsheoyIAt+xEszAhyjqpnBRKGtx9IxmHRktz
X-Gm-Gg: AfdE7ckQWumy7z84Zp90KGtoewmY8731N709EGK6RIjsUHgDxrmj/xtr77jP6ttD7X+
	35V9RXuZd3aWI6BvGUTnCvlfR6SeofcGjliTYNOwDPT43L+ozryNQ7oJvCknDPxPh8XPhNO00G3
	7u4LZRPmpz428D2OfIFYWITXzLvJTgOMPV1A2Va0VF7rbPoKSKob2j89drw/oCmHPlTUagHZWU1
	fPSwUbqw3wBbtrsKxqmlgrE5Iw4ibvaagxt0jzSnD6gEDblQizUouu3WuUvz60ZZqrSAFEW3L6i
	V4vedDtD8C/VZc/yMFppPlAhlREZUcvK3U+ZjcKEGiew8TkAU1EgQcEt7nH1kjQlS+FU+7f5QfD
	644jny+Vjj1AfLoXy44Gh50G2FboJfRbQaBLyKb3OKr5RFS3CbiAez73ptKpnTw==
X-Received: by 2002:a05:7300:2156:b0:30e:cef2:c3c9 with SMTP id 5a478bee46e88-30ecef2c4dfmr1551015eec.8.1782715692503;
        Sun, 28 Jun 2026 23:48:12 -0700 (PDT)
X-Received: by 2002:a05:7300:2156:b0:30e:cef2:c3c9 with SMTP id 5a478bee46e88-30ecef2c4dfmr1550992eec.8.1782715691981;
        Sun, 28 Jun 2026 23:48:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm56154774eec.7.2026.06.28.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:48:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:48:09 -0700
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm
 Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACkVQmoC/x3MQQqDQAxA0atI1g2MI6j0KqWLjCY1oKNmoBTEu
 xu7fIv/DyhsygWe1QHGXy26Zkf9qGCYKH8YdXRDDLENbWhwIZ0Vd9lsXTClTqQZSXrqwJPNWPT
 3373e7kSFMRnlYbonPohwnhfBqBP2dQAAAA==
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715691; l=978;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yKAoT+km8Ld0aGDl7IvJTU1MS3bYbIRRbUIueCAinu4=;
 b=3wDMyPHXQOS6VG4ee5e5bj1JSmQYIvIKnJN2Y4wrozOA8u5QKntW+ern+whd5ZuZQ/A4VqGVx
 ZJBqKi62By0Be5vENmoIWHpAKv/uESZKfjS0jZupr80k3x/huHg/Ced
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX+VV7hiEw6U1F
 pS9A2fERB9IzjH07nOoMyl2IwxQE75HiRO1tQ0L/1LO9HHR5BFVmh9xEyHKHD4nlJsEzfI+FX7G
 iVNQb7Np3Uckc+TQW48FKM6IDX9WKVHmDAzoWdSQTFSKVl4PXUL3x8h8mJlY8ra0V/wYn7BgeSw
 TzjC2+5+6fcDU1BtckvEhVbxclSIgksUZH2GCW5rlDE6BBabb547I+Wg/akytmHO8wrvrDpZcag
 gzKOk9eMrWXzv865kPYYtAZEDxT5cBTlPZMFP9T+jIEn3pfQAG42e1/HGadcfHIyNg4suoSJejC
 ykmyJ7q53N7FYWdwZ9jciuYqD59zvKbZXBkN1FQxC65gDmltDShEybwvcBcGio9TF0E2LbZQPly
 aJxBYU3FDBOrp0vI3WYrr6/UAsf4pmK7mFrJ3s/WmLz5QqSoWN84RLOlzcHKE9cOFFoTzMwOox8
 4XTf2w/ssbfcwBq7SGA==
X-Proofpoint-GUID: 4m8h4DLXAYDx15G822x2jH7nRjuuP9Zr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX00bZpDC6yglJ
 QMHYq0xJN3Zaqd/NBbhkD8AeoWIRgUcX5ACASnZRfE92Rd43CcGY7XulwNVNvLGK1s57IPbZ+gV
 sZ/Sma85gQiZlgCNJBDm0/97cyvl22w=
X-Proofpoint-ORIG-GUID: 4m8h4DLXAYDx15G822x2jH7nRjuuP9Zr
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a42152d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dsQ55Ntb7nCCdps8rRoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

Document compatible string for the QFPROM on Qualcomm Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8134ddb54e13..72206c44feee 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
           - qcom,kaanapali-qfprom
+          - qcom,maili-qfprom
           - qcom,milos-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom

---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-maili-qfprom-bb7ff3daf8a7

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

