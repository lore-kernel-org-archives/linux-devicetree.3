Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DC480DC7
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363827; cv=none; b=Reg0/s1t1RORzjtTUG702Pc+/yWcCjE4zS1QSudUA3xQ3/bVMH4DRXuy44XrSpAYJ+ktnRZ/477DHBPQrPmAlDmv3mA23EcfVByad22qhHqKIMzkK7kJk8zJauMPBJp44Djr+sm8PJ+YD+K7t7jl3tKKjJ3TTDpiFwoHn2vEzgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363827; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ah+3KQe1c3uTkJQdS/bk4w1g08Xo3OfbRgQRs1thURKJpkwkVlkzOk+tzJMVQSXGAdQnHQqCl6oyOrZ+yJzMgXUFK9j0cT7P+49uJ3ST3gZEyfAfHJiT9FuJGn76YK1DvQ7El25PQJlTcXgFnJgcHVTM0oo4LpXfjham3T7vMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOmRH/to reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOmRH/to"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmL32711351
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=XOmRH/toX8dbOpqKi+tJy0eUIgx
	txR6mJGJY12YA+kiskNqv0gDFgTQMQCdyPmz/rCp7Oscv/BVmLq72CSkqccQIOov
	I00NVHEy9b2LA/7vzk5nPz58ASsujhZxnrmJRrZT5KcY4ngkY0RvO512EScACt9v
	pofvLfI8XTaPoT4NkCr/lLr47w1FBhMpYdfExKoRPB0Li4Wu01Xye9UZqxYAvYe5
	9CHAVhpWmtcwQho97pMcj0NEoO16Dn/8Agd/TAKIQlNct3I7Km7m8E+yqJuYpXwN
	Q19mMTgAalFuLKM60Vll4W7kAPTIOB5Q29wlbJFFaLbsU+e3IuZjkwc8RZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1dbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so740620285a.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363798; x=1791968598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=EsMNodzC0PvikIEHa2vcnSKhKAju/bEfCo9B/TsHP7xGWKDJQQjkhaH3j0cvkiC1Pc
         lhMQPeQvsz9QQnF5Y8MOpVQ99m9rDz6EYEEXKmYnueASKqXu8oLm5JjOMGTUo4YOso54
         sBKW/CuJ7C8vAIOnCAGw2xdJYBZPVjzdhO9g2GBJvmYrkjlz5+cqOCjqOxHtWxA9olzc
         Et08TmWcWyBKJgIQajwZVMuZp09Htn9zxYo9BEbweu7JGAvUqd+2LDzXF0eG5AEZRgDb
         ooHbyxpPmZtpMnhFMZtARi6cHWG5pkA/54GNT4nmkwTcHCmfdloYr20KmaMNDFz7HRJy
         1B9g==
X-Forwarded-Encrypted: i=1; AKwUvBzWcn4pcnrxtnpsGv4zzXAenmPbEJDyBPqxusmHiwsSowb9hmZl6QF0fhEfE7h52WHISxJ52P31QT7a@vger.kernel.org
X-Gm-Message-State: AFuF++m2EPR9as2qGjkTiPzzQRkaOI/zncFJufciE3F0J0khD1+nc/FC
	VblysXfImOCsqcRf5MZ1HcIINnQWPkcdn1QMltUwxoH5xXhANK3eivp20L0qZB7ow60OTxpATG7
	jaZ+3TqEKf8mWisQ0WzbHGcjs24ITIctnF6ts86HFOOH5qas2v41zFPm+Hrk0Jpw2
X-Gm-Gg: AYBFou3PBHsawKJtNecQbyPjlB9uF1+EpueN6jxz0sHWNNgLf8pizaJf7kmId7DYfVn
	mpHe4KTleJ7ZubUds5ieJaXQ/5z4yDZ8DipCDawGBCvYTb2v4uM5hVrsJC4/gsljg0iNLJCyT73
	b78OCiZidfT5aFjubEYmkEji7/HGvMc7oTHPj+54mge08lkb7FwLoCL7xw49UeNeM2Q/p4/jkxR
	j45iHoJ6I9xxjtXGzrjNmt5IrIkX71f71zmI0xtswowjw+I9cUBLLYCKzMCEzd+BBSAHSoRxmW5
	79DWJcvRqy8qN63BNNtUpmOlg3sKIG5t8vAYUgNaNWvjec6v6qbzE9yEKJ4=
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311437685a.31.1791363797612;
        Wed, 07 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311428585a.31.1791363796962;
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:40 +0300
Message-Id: <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m41bio7dViYzPEK0mZE-_wjum2hT8YvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3f6F7+mEQC2R
 gTFhpcUA8lZl2EHQFxUkqxmfCnTeceoPReo0OYxqSGTlBS8IX/tmur94gNK3vk9guq55frquRPY
 HliORXjndGEe2SUryozbSAyYkkifngk3YmhHU35xAScDQvIeMBRkKFJxOJqbx7xJF4lyiXyYIv8
 6+brBPWTEHeKCzoV2RmzgDQ7/BWgxlNPA504yvEo3WhA2vJ88OFmXOvOLg7k/Lh4vjym6pmLOBe
 aaYKcvmwxfECCHmSeJcgDE/uZP/RgNnwyL4+rzYoRNpD+4i8CjZPJkK70tz9+Dg767egSnxq3N3
 BKE6V3caLUiJ0x51PjZ1d8TAjm7IuipDCW0KJmWJGJHtk0Q4ZpzYqy44fDIQeUXWTx+L9BzB+u+
 RFEQtcdH5k94CHSaRlOo1mLVAiVQWOwAkP4KWgQGyk8akgPQfub8NQ82z6wb6YIs6udTE9xikkg
 v8Gtch9y0bSPXdQOWvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0nlVMmARkBZl
 3zR2knHYoNP+wNIB4+aOmE8tM6zu1YKf0qOMS65SAq1UIWNxqb3R/0M7N+Izc4DQKllHV2JQ5tX
 maCyLW608bsTUaC3KUTeock0M/XjuQc=
X-Proofpoint-GUID: m41bio7dViYzPEK0mZE-_wjum2hT8YvQ
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60ad6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1

