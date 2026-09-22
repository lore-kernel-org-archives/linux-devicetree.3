Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE55237B9
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063510; cv=none; b=tFQ1TqHwRxbGrpWJ4HFwIH+LKdbuO8/TGdCyfBip7AXgUGJzR/Ez0uJK6FYKWd2o3ipPSCZd5RlNYuv7bB/yTyaKCaXHDeSPoVNAbB73d1yj3d/QRTrFaENTpkQLlRnCIVF8ITfdWwdgs9az5PRqwnghM2/+9uSLuDzfECVHBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063510; c=relaxed/simple;
	bh=79sCH6vRnTS7g4u1Il9i739arc6ypCrjwohBoPOPcRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVRbhvj2E5xhAL1fniJAREGzjnochAirvCgB+oV4IEMdiXoUtonU/VVqeYm3LNEI5JBr9L//kCiERpba09a4VBGNl+zSo6CTR9OY3Nc9X/1xP1RV50lYD0RxR5vOOuksZSjnfwjCE64mpF5OrxlXk4vkxu3y2WEqwXkZJX5Rx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLN19sob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYGUyq7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLN19sob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYGUyq7C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M75B2i1978627
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=; b=RLN19sobYqRTvMz/
	Ley7OXViBQVuTus3YRooZrNkSZsTdxy+BJDwREJwHb4intQ2QPEUOwRCWgkyxANm
	hBQI4lPEF6BWrRtaSu0+sQ7OCXVBjKaOsopI43pTuRT2D7kHMex8WWMFLYhp/9Fd
	GjsHXv+l1iBJRMoAHOPE7xxu5bSVC4GPVzdT2rDfjMep2Q/R2Oxlpy2rq6h6Ji7l
	5/DDXH6ExLcenuQA2EB6z4UheFOULB3GZXtfcwuq9+hkJ8REo0Abi1M/f7ylh/x/
	EFhKNuUOMJQYEb8niO1BSW4tY0vRVbInGy8ulFNm/9i27x80mmTboekVWha64wsk
	oDECdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hq8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a183a0e93so829336985a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063504; x=1790668304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=;
        b=kYGUyq7CMy6uk4GGn4DDMvcmRJbWlyb0fw3nKvAgOtQHxbiELVuzQOBVWMmfz2YHXi
         dloUfG38jG8lTFIU3G/wN0BC2fWzS1N7G7o/i4Bi+nJAGIWxuHIo16cRp0eAhP0O1RK9
         QwukPM8v1N87/rP7VUjXUC1uoBh0SuOThmGRGXPm6KHVJ/FoBtEgRx3laP6EQI87EPAl
         Jt2E/ox+8WrvOEOCw2VaJaDuesNK56PTWtVAz8o/FuB9idFHlg+vJYGMCT7ZhubuSei1
         pNduQDO8dkFMePEi7Hk1VXX0clzcKqX1wtbroG8yW1/MiM/w6mcojY46Czc8FHPSo1qC
         rLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063504; x=1790668304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibfeLaQssPMfQeY2RfDzEAdo6ADoMbHmqZJd5Y8uNf4=;
        b=EHq/J/dTfjeF40DvpsCnGV3FTDz1oVWj3yRieZ5xja/tnT2oQrGk4hTnJ92X/etDby
         mRMdJjx+Kky8UJNd76n2S1A3VS14aYPuJJKqnmfswh6QUQ/3KQiJEMGOidyGz9auDf8X
         SYFK0Y3LUOsIRhhHZIEPBSmlWjeXY7OCd06N9e+mlbUfKr098gVTQKUEoC3R4nE92idq
         zXGkKj1whrVaCuBxVoqNNQRMq85L1hzNks/kwXGWui4mc6v5Pn7nUtZggWzUfICAokgg
         8cQBx1G4oLOHqtIEpZou9wXFHNtQ5AAQROVAX0Ywa2LSi8h3jhzxucrzY9f9cBEhOMEp
         vTTA==
X-Forwarded-Encrypted: i=1; AKwUvBw45VxtaFK2/8+2Khmkww+5VT8tTqilphcyKL5mAVwC2rygjNFxCEK6DmAwtFpgLT6KJF7Pxgu+7j5w@vger.kernel.org
X-Gm-Message-State: AFuF++kQpRqHcjfJygxL3F7GFT4cCfUNsI+XjzBX1Z+Dr4OJKIfZga8I
	PIYSe4eRY39ZrH85J0ULIg+hleWUvZNp6rqn4lxW3SvURxRJrurRnuqeEimNiWo6LGs2S6qiFui
	tZSDQRBDytBLg2IbgIC+0jXM18lqunSr2c7y67kDEoiaqFt0g9hbTEO7R1w/NvndZ
X-Gm-Gg: AYBFou2wHTClYcX97RP3F82eVyDD+ujWOFvegQWKpmUl6fdIJl7Pf6EylCF30PqI3TO
	eaWuF7SWJTUtqnBUHhKHugV2w2OKdlH3mnJODtkSqmhFl8TeRzfKpUxhfbi2fEApZLFaDl2H0Co
	CbaeFQpIqPHCOuHVKxu/u1uNSaPaSx2f2azvdJkhHManH5xAAIwyu/GjSZCTvyA1MwuLpHwX1TC
	SxZ7buV0Xt36/l+vMMw090jhYMA0HhMaBwg1iM6qLUnxYqe1jbVQcgd2ek/9OVleAYC3A1Swbi1
	Ivl5YZOWcMuABJTPpUXuI0JmbOPZk/oiCgOKiFTF5CKR5HjrrDdot2Zn1QdLa/EFpbjPM2gb4mT
	3mD6+0mGB
X-Received: by 2002:a05:620a:298c:b0:93a:463:1296 with SMTP id af79cd13be357-93c15d86b7dmr408274685a.18.1790063504558;
        Tue, 22 Sep 2026 00:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93a:463:1296 with SMTP id af79cd13be357-93c15d86b7dmr408270885a.18.1790063504071;
        Tue, 22 Sep 2026 00:51:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:16 +0300
Subject: [PATCH v3 07/13] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-7-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=79sCH6vRnTS7g4u1Il9i739arc6ypCrjwohBoPOPcRw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN4r8x0RCd44jSgBCC77pNSBMO5dBCdKoF1k
 0a23o1IAfOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzeAAKCRAbX0TJAJUV
 VqwGEACuW2dbOk6xDhCVFEIwyfnXVoyZlAbcylOhhknFtBWFD6vFkzOha6nGk/XLj4JRFFPeXQr
 +bZcRmFDXdRFkBHAFq4QB1ucHLSKOggpydls0SOGks8ao+8hyT+i6RtHZpWcOB7uRazwYfhYkp2
 W1hn8cVgo1U3UkNNPbpK+S58C3cevcfoqMFlw2iAnZrA0WluVBLYBxgia8n68WlRArO4vkDjcSe
 +WdgjM7y+6Rcs6GY/DPE5MBmwr4kalJSbPMhKF/Z7e6W2BU4idD7hvUoqiVpX1ELirrE3+ePuhm
 GRnuzh2wBYtgza72LfvdT2kE5DEUe75Bizbmpe5GUnkWCQDPw/jmWf1ADtdKiR6E2XSsKNw/7uN
 gPzdDyVI7rPzSCZuj1ws/VNZbwBwhFf7R3lTXJcnfgyUhYxp5en7wTILD2UeTKMQ89dverEZugC
 1Z9bDDhRjoKzQ6QqVK3lRwsw9y21CF3liFXgl3CRl0i2ZzSw6BqY/qnCiKIlqPuG+pHf1aj22qb
 v7dJLZMG5InY7YVISc9plV7yWH/68vJ1tQBqMFj4RT3NEzPfu8ZtKDchNgf3iQubO9DmIpG6C61
 32myM5obMl6fks/SdyAKbAOY151HBTt0W475GKTvHubDfHbBKpb/3QzzkYLhlKxtNNP6SGYgTEc
 zs9XkPcMQ2/vL4Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: rM7IpAVtCLVmWKGQWmjWMZEfwT1HAZkH
X-Proofpoint-GUID: rM7IpAVtCLVmWKGQWmjWMZEfwT1HAZkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX7cPY5ZBsN8D+
 fU5bR5oALHWpk2TtDe9vB0YsLFAwYhu7jLmv1WR6pR5bdUYgao74kqb6reQKbRtrzJmLGPd8L/h
 4glDgdufJVKPHMWqZNs2AGOceRtRB4fEzF9Qdo33PWuEzhe+KBVIHNDojV/TLUDTWX6OWx5Etup
 68VQyM4n2kha5wtMNysqy7odUHrQynkEv2u1YuChICilF/ddfdNvg7FZFXi+jEB05NznpE7vOzN
 lmFXwALObNstHxtfAB3X+fnzOjVMQJEVqh6BryOdDFxapSd5A4SgkHEt7vvwX5NQjosgSDwRLpo
 /8jil/zCIBFHk5r7objABM3JSL5QPLDBtH4EsF+lovYA0qE3S9q6t/VEUvZlZUbjnA3XJDJiM0x
 V91+d5/Cs4xwlEwj0E51mDl1XPp/tkdqmaqEpumdLrv2N7wQwTmBcz5XgIOK+0LhsiJhJLF0bRa
 JN9/hnL7Cmn7iwBQECw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXyMBvjgzGKIKL
 TyW9pekGsypsEdkngaKt/IOVhesl9XJ8BxyPgobB5cZXeMC6mtM/ROd/DLttgCAXz7C+Pe02No2
 fxvSZq/IM9NXadCg9aWJ6eZz5kD8eXE=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab23391 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 6d26d73c18fc..9b599917c15a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1268,6 +1268,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

