Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314F20B80B
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363805; cv=none; b=MljVJX6m8lVVwTYm4GKhTbuxExNq9jKvVgqZ6RC0S5/g0oHU4hwg9K9VPJrV0RSkvRLT3AzdfwXwd8hQ3bv7TYh0rjS4MJCwVNCoIvd8dj8Yds0ypraxUSjtKXnmyZ53fYkq+tUh1Z8aBniRahheHoFAJUdBusZKTFJq13sZDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363805; c=relaxed/simple;
	bh=o5oMWdlrxTsRlmHOBCOZYGSUWpstGq1VRL0Ihw6vWro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jArtGLH2G6riv8YcVUW1pmWGv/8z3AoSiYo6uRhVBQZMKMRmPiHdsMLJHrJXSwtRSVe8RNAxnIjoDSH4zCQxdazuME3mygD+PSthOy8z2ZpEo+9KCBhaRsydR+zortv4Mgp8mCiPHZPaekV8ufO0G0Edaqt+kAX0bpoRlO5/X3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFkMoETG reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFkMoETG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgwB3334712
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vf6YFVaTEQg
	R6onACOGmwSOqqweT/zzISJg73uugZWI=; b=AFkMoETGrPBVySR23V2yQ7qaOuG
	l2QSMgqKauKCzk64DgQaA3YhRyZo3DfJB+VktD5EX5BKP57szF6kfCGbbUyFCkYk
	78h5PDV6Op4/qQCH1JJOoytZOrOs9HlpZltAc+POU160VAE883d+JxLWHNaP2RlE
	uyH+/9kDYD/l9GkUpCLimzV788/Vmnr3xAeWZA2a0Y4vJJN1J86fRf2eCz6KN+aQ
	uPdbL7owxVeEJFtLi6llxRKl2SYigIH+5pjXw2z0JV0WFH/xVoGP1PREHhzmLNNo
	HP8GIyU8RTFALGsK2WHErd4fooNyLSPElLsIqZ2fXvQns1UqU0d7ySkjLLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623b0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so895334385a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363768; x=1791968568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6YFVaTEQgR6onACOGmwSOqqweT/zzISJg73uugZWI=;
        b=1e9o2eDXwnyKe/WpxmbVn2wBfARMfaEr3NrS/xkvHWZ1a4evqtO8HUkBGcgHGvmQWo
         uoVKb/0yn1exUxtSpsAiRkFBcUEZroOsTE1p5jPy7mX4E4WMvt6vwzmD6BjEuiz7PoCo
         kXF7F/+EzlWH6T8HAOKb0iUNlO24mi9nH2IqcB2tb4VxAkYYzAN3dy7MubM3hKkuYvZL
         slexxIuHMIPV6SSUeTNC10DgtAaLjSZLCN4qVA0kdrG7oXhJ1f9uA/tLut1kHftd294C
         uCx+Jq7JuNP1ceHAOHTtv3d9rLfU4yIfkFTh1HWI1uHXmR6psaHGhPDWX5L58hoHydnO
         fEOQ==
X-Forwarded-Encrypted: i=1; AKwUvByWH0azvObU15iIkr/sRPTmhogN55n3cgkvjuD2mp9/fQFmbvkqcdzz61tq8YnEc3v2LaDM9O/RsFgd@vger.kernel.org
X-Gm-Message-State: AFuF++nj66N3zWnZz9bn15I/6y+ZCDI4k0aHvr/RHdHUqlkRGr5Y8eCp
	BP14VpUotIfkNDP9gM2iXf8G5ScxfgO9DcLJvpflh7v0VYXJq6FUW6MeZxQ/HOAtq/r/r9ijDSh
	mWAJ2YJm33MUhiOWsE7jIzDIh/57UJkJWaX48zUNkiKUkUiKibi6PXkMUXWum96+j
X-Gm-Gg: AYBFou075m2bwtR6iuhZ6hAMhDXKJIxxYejNQHWC0rgRgwQDmLhoxhFk4OxOxQwubfn
	6LivB3Bllg+EUL+ZI8prsWXAz/w2DReXcC1YKhEik7PTda7iMnjDmn+ZdKx9TB+qcmDzh3cdvmC
	qObYPqcrvUQ7JIbNW3X4DGd2D4G6/OZlKXiXRfQ/wngu4JhrcVRQh9dt9rBYXHiXCT2IBS7N5p/
	0ksRnuQ5zkwDg0xckK3gO6q+W8033S4hzpSucRKWIRCJgdLadBlriRaQunN6dqFezZsUqg7KB21
	gVd7luUIVdAa+rT8lL565O6pwf2Uxj1BrAZ6LbeTMqc61k6KtJTxFiQEODM=
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303008485a.64.1791363767606;
        Wed, 07 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303000385a.64.1791363766962;
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
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
Subject: [PATCH RESEND 35/45] arm64: dts: qcom: use SA8775P IFE resources
Date: Wed,  7 Oct 2026 12:00:31 +0300
Message-Id: <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: oH2pVANz3mjNs9aS5sMJT8w-TsH2pT8L
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60ab8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX8kSzrxNEqPPD
 TlOVUkxp/nQRZKwjt8uPRbeAucuvUnP2j92zVmqUdNi3v2KnYzB+PHxkbkSn5n8NMNgvD7h9zxO
 mtxjCBAuatXZl95Z7pH7T2lXq7Tl8fw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX460gzPgZtT2y
 x8ROaeU1eN5KYNFYrRpSIcTqXFa6TT/j69tqq9YBrvCBLcvruPCw7SulvUvTSlHa/derMtcQsBx
 q872I6qYm7E3y7CXU7QA2uIrkNEUg0DI397/N5ykIYubJyp4ht3uImQTuSQGj1FTy8RAthDPlUC
 4xf4uxLKh/++6/MgznGtcTHX2yxiDjD2u/2qpDG01Epn0X7q3RYpaEI431Cz4mNNhG5me79am08
 NrqYD9t3vfT1yqgP50z2Xi1zzGY9O8hCj1HISB8NcW1iWXk5NccZhgDmup2kd1ElBMtsrDtwzly
 Bwt+Pf9Rt1jD8PHomejFl+rxCKXehgCpzz8tkgys7DUiekgQh8reFGfE7RtqclnEV8N8kEq5SCc
 euKZ1R4XfPJARvwBs+P6zuK6PlSXjjv4S53t/OcYwMu4wjQJPedA2aIck8MdlXifNi3loDpt+OC
 0h5aWxFxUVFS0nEjdVA==
X-Proofpoint-ORIG-GUID: oH2pVANz3mjNs9aS5sMJT8w-TsH2pT8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Select the local SA8775P CAMSS pixel-path compatible for hardware
validation. This commit is not part of the upstream series.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..59be841b89ec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5167,7 +5167,7 @@ cci3_i2c1: i2c-bus@1 {
 		};
 
 		camss: isp@ac78000 {
-			compatible = "qcom,sa8775p-camss";
+			compatible = "qcom,sa8775p-camss-pix";
 
 			reg = <0x0 0xac78000 0x0 0x1000>,
 			      <0x0 0xac7a000 0x0 0x0f00>,
-- 
2.34.1

