Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17E397E75
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307232; cv=none; b=ateunsflWrvLadZAw1x1lujTng0d3Ls8nfoxBgdfpoksMN+6sUL3MCNozQ4me0waeJgX+VtkCIuB5XNfmU3TP0ZQt4dWhUxLKYuWipB/S4ZGWXk1/rmyUSnLfsFKmZNOA/FUxx5nyD9N39OgnHsLRtPDhTdEN90E1yFi+rUaKS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307232; c=relaxed/simple;
	bh=i6kjUXsWMMvGZpVkGZgoZuYG86BurQaFVacwcpsLGpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfWlDOEEwlH4pTEe2fIqkFKl15EpoDfKxAkhRoXKC4bKhShHbw5Y+B9v0FTeyD4NFhHaX3LC+nCqkTXatBiUYuG2vep1GsUtoxWROT2ukTgzROkFXlDn7pO7GyXS3hPBDq5TWsyDDvE+ci0+0Cvokaxg/7bv/3HwoSY/kWnSmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSXPRiVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tr0zOkBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSXPRiVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tr0zOkBJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518xKMk1012189
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 09:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=; b=OSXPRiVhNRnIuaFt
	/jcJLl1uTz1vgCteCW2TVILz4LUaqeb78F/8e1kA+LFt9iOriTBRbvnVPMo7S3WD
	EucL4DJ+Q3UeFkKW0OBUIlJIPZ9WIsiCDRhMeuSmLuBTfj93IxkuO5xC2EBPqqKw
	4QSzBa/wUwoL6osegGrgwbeBuQX3vIJKE41C2qhQ6P1wrP2WABBcCS5A6adZWT+4
	In5J08VCcgwDxJYQdNeccZSkdpg+KLjbbKKsR44xK7KvVylkcefk5x4al/5kYyWc
	ZyGe3+7dCSdQG/rgmyUah/PYPc5DUgBoTWmwa+Mg9EvknrnCQ+Qx4dz0ycQiCicW
	9B396w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98et0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:47:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ccfa109dso205761501cf.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307220; x=1780912020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=;
        b=Tr0zOkBJeHphvTytgoiYr5qnL3wcr3YRmqPPucMbotR1xxDuN71KHnMxAG4bchNzpt
         NGhIGdR1tsGlqkxghjKoSZhoUP3PpxhHgQQgr/KL2t0PUb5Yn8aQ+zySVhBr/fMOMxbY
         iLHmnv5e1TMaoYVQrmn+UMI+vgEQ9PmIBRi5iWElHq6E5II4bKzyBsK5nQA1fyvSO18H
         loVeArV5E8r++o2XoENHiyMt8iAMJ0N1zYP4cIx/Z4HBsYRX14gHzN1SMzld3MzTGb4Z
         5z2HOrVCPAq1c3t2y/R38FstKF7p2ZY+jO6PMruz8OQ75fka+figlCzeNcHulJ/mKWb/
         A6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307220; x=1780912020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=;
        b=tL6I48N6pNghXzA41V000rgVRIOxAeNvzJkuSVoVXAPlgZ9xpY+GYClx+FtMXO4XjX
         Obup31JP6um15v55osDGYLW8xDOk74t+GeN63orOak/qncDoEpw+BO308NrAN7+LR/Ar
         yMVvWMqaqUHdpH2YXCIKwn1OySn4vUDP9bUNjDBYzTN/04BuVdWq6kIPKna+SfqSd/ze
         iCLB4Jh/q7fIJ6+zcaI3GZ7fmYvNXrwJVH07rrMw8GVuUqtpbW1/cc9SdAjFBqizojEw
         CW6FYHilKoLmUzN1PrIP9WiQD0uJ9UHTTiUKAL70PcVyCPnTGO6wWb+QVUJ176/8ERHG
         AorA==
X-Forwarded-Encrypted: i=1; AFNElJ99/4p5JhCnatHi4JKdOknwbhuTborchwZFMEW3oVSyjoAzCfvcm+MmTNq00d6UMugYxiuigj8OyYZc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqpn/Lyn3CLZCV+o8KSwiu45I/fwGEyr9D9U/pGcf3nteO258
	Gy5l6gyIoXlACsd5csopOHdReptKiDpYPyf6raLf/VIEmnw7Xn0zdrjikfzbUp43eJZUOf3QBzC
	ypNe9V/FaGi3mhGn7meAC6/JWgCA33rNuk9x5IC8VkQ10AYBO01rYty4IodY+oU13
X-Gm-Gg: Acq92OEW0HJdQZfsxZw57LiWSMZzqqAHI6E0rY/+YGq6sCDESIz+OdwFeyPwMb2Ck9W
	GHK1bASuclNZtLf0gjFYnw+hJnl8st90Jqx06l7duBKxZQ6pE/DuBkEXRxgOcQJ+H8CMdNoz/Tp
	SE0TQlWKhphAG5lqyrVsHa1u3N+1RqBo9ST6F3DRGyu7ffFvw/kMXWa99mv3sJSsdg7+Np9aMiw
	OtkjzoaaZ/c/DqCRz1PQohnNGSGOSl6R4xK8zgNAwN25lXcVz+NYqxTPxDPuRe7Mudh9GFr/LCI
	T0/ZwvV62MRbnIpqDYMIuc6OvoaNfvnOAFMjbsi76di7SOxqo6vjptJ53j6oqos6iJZ+y7gUC1B
	ofDaY0ZcW1mo1kD6R60MIcB6PqjaU/IKcDX5ACOFlumN9D0ZHKBzaPcalPFjPti2+PibolMOs9d
	rvvH0rgx6BpxcC4IDB/xfF5JFM6uF/KFPMwKTZ75cvRN+PnA==
X-Received: by 2002:a05:622a:a887:b0:517:61d5:2f85 with SMTP id d75a77b69052e-51761d53795mr1967911cf.33.1780307220289;
        Mon, 01 Jun 2026 02:47:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:517:61d5:2f85 with SMTP id d75a77b69052e-51761d53795mr1967561cf.33.1780307219912;
        Mon, 01 Jun 2026 02:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:51 +0300
Subject: [PATCH 3/7] regulator: dt-bindings: qcom,qca6390-pmu: document
 WCN6851
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i6kjUXsWMMvGZpVkGZgoZuYG86BurQaFVacwcpsLGpY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUKv+ohTcsEMq/gMqjLvJIpmvW0bhyzz1rra
 Zau+IHCLCKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1bnUB/wLeiJktyGGPY4RKsuvLJcAoQGkQZ2y6YnS6kBfDk+PqAEP4E9tvABS87UPQNzBkz7dswi
 1QqhKybyLK+mnYwrtDDXhsvf2VoRJmi5aB++NIpfdGVEHiXdMxUF5AS1W+rDHHufWgpaGnu7tjC
 2z6jdD19j21jrbDJXNugJ0vqMTREb4DJdU4F6XwHn+fZug/DND9RTLR3Rwdp+Y/b4odBDze3n9z
 N0qozm1xPRUodqPHVrA57id/TE3sI4sVSYd+L+fCoW+Mae04ma3v7GSg9jH4uQviowH1dAZjaaL
 zY+PMnTjXfiKTspjputgXGs/F9wRj0j5XIQxm5Af+X8X8qq3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d5514 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NEHNw5bNxon9FmZXvbQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iandTO0rVRrG0j0uLZQ8BWhy4UHHOI4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX0uNdI26LlSNN
 hGJncDUZxDGjYOJ16g3z/yxEqJkv+W1pkNMK/rHolQlDSbPuipF7WHbEw6IQQcV/exsAA2vB/kI
 whOtejE6Vf8Ji99Wzg3EZK2WPvxgLlWLFVaJ1zj1eAXf8bxTeafy/RbBWzBX7i2P4LKmX/T8WYH
 uNhBRPEcKUF9ZTz8vxb9joqvZxd6LX5lidonOD/4VpoEuW/A0UoHGs/lGuCsTzK5qXXC4hfQ2l4
 2GXhnqXzIYHQ/sC0/1blUqMJgweFEHPV4gDbvdhPldwfNh6xdiw1zM1Ptq5h3mCW3byM3zXAo4O
 SINzV3B4OGJHGbDkToBnK/Q7oMyqHaGyr1JY2zwYL6DVKVPv9Szdg1e2btcLMX5iPEQOw50bsT3
 5rRBI8e+JqA1ooFehBcqFGQry9LUa6jBoG85FoI6NsE3VPlbc2EonyJUpn8zX1+fRL52AMVvyad
 ysPXo6R2sYt3CplA78g==
X-Proofpoint-ORIG-GUID: iandTO0rVRrG0j0uLZQ8BWhy4UHHOI4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098

WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
it. Add a device-specific compat string with the fallback to WCN6855
one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 105174df7df2..3d3c6fa7ecbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - qcom,wcn6755-pmu
           - const: qcom,wcn6750-pmu
+      - items:
+          - enum:
+              - qcom,wcn6851-pmu
+          - const: qcom,wcn6855-pmu
 
       - enum:
           - qcom,qca6390-pmu

-- 
2.47.3

