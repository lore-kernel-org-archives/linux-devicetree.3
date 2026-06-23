Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9037104F
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209143; cv=none; b=Y+6aVyQmWNbsHaZuR8RMl8wmGveJZNsMOBvGXt5qnKyuTG8CXK2HPtQ80cV4wzz2+r0LyZaUVJo3X87gVs+S4YyPHNDDNHa6G79gKahqnEXeofp3hsWuyO9gch4zcNJGInMMH5YvUtavQS2uDM5goE8IyZRJsq/3yIyLt++gorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209143; c=relaxed/simple;
	bh=rojkdL9HdJ8xwqHtrA8vSCQ/5DQ4D7fL/dKa23jycp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ant6zmPAy/Vpo6L+aJwExLhFylT88i4MyI2biR6MoOex4izg83nPTtrIHDLk1JrgvuqzfGz8ZMXIP2rY0PevH7JYqV06KghGfhai5qj1rO7AB2poKXuBcEY55Ohf0Wa+GgELntKinM5+LTjhx9TgqGozMON3+F1ydLWsv1LVq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acDN/84t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxVFnMFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acDN/84t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxVFnMFV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7koZV3228469
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=; b=acDN/84tyMJDKCqf
	NpkvDkIu4Y1yiJDtNiflg21n5w1puD/MKVS8MhcUJdEP3/ewnH3IJtP9bl0LPkxy
	tNMOslvezK81/K4MFDVCfs7wp2bsTHEjQhSOdZ2cBTE0/8OVyf9qupYe5jSsp0vQ
	4lUJwOh81CPpuZxW40vvoruA2rcOIgSFjuEPZ3CkQ62GoPZqIu/cIFNZ7cN2MCgH
	ODMzenMiSA2GA8Fsolhxy9hm091D2KdBNciS1ZSedK7INsqypLESzSjM6aS4QJY0
	WsW8W+ck4es9vOn2QVpb8jSXX3Nm5+QjfbZBkIENwIi2YkGnvdV8wyMsZDRyuhl9
	id6PMA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gkmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137fc6f8e9fso6043191c88.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209141; x=1782813941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=DxVFnMFVl6JMR732LVQ/Yl7MFg7GtcIbs3rsh+PgrjxBkxKRi9eMK04U/CTjLC9URz
         GQKdE8nWOVBDg6D37SUzu4I2SSSfDCW9i0AHeMjxpLh+lJryJ1C7x7eSVokBCN0dlh+l
         HpFQihpq6UpKyLhgol71PUHHKtFkPiL54HctRbB49nUaKQVKRgxDxE2OwtGAE/x37euL
         Kql4bSiPkPfO/s/cgblHoTrnbwLDyrDCQAsxtbDGh/irxlkiZRB0ckyFmUWQaqkWNioU
         6OEA7fachtF1POgi6mtlaXKQIAGu4q3gH+8r+h+QwL+Pu1QLD9mA/0trnGA9p4i5azcv
         MRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209141; x=1782813941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=Z0M1zOSOTdOsuiXjCqCXlaP6I0Ht28IE6Ubt4Uye5410wBiQFWEtoZh22o5jySiB8W
         TXiVM5r5U2SHamYyMdy2Bo6hT4a7CA6UspK5GzPJzBHEaB6PYMkDsmvVMAvnbLBzEZww
         I83fAIfyXB1sjnq1X1GAt6ohbaKFY1KrR1WNWEOLExgUGnTXPDZU/TbAo8eHBtnh3w87
         0w+GQ53xB+aocflHXNDaPOOmiKiLEZpgoeF84YoomoeLntSL49UPsq0nLohpOzj19rZD
         4swgF2NbzX5gZo2ypv9N8z9KR/BeepzlESAdZbqMn+FJb13DtGmqdVAhBZN+xLIR574o
         SfZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U3CK4BJqi3seHyhzYaPQa/ZiML1gr98+2o4CXS6UGD38ngMrhRsMu26XQwEIUWw9MM86g5T/KzLFD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxd8uX1XdF5qm5IrZonoCrTT3+yZ7puMBVitsD7lvKall+cobY
	QhaUJmk1aJ7pIs7E93nRBe++8r5RBohCrsEw7ALiGoHgicnHd5ysqIos3FVcASXUtaOaGUwGWVL
	M9HKBIlB0swkyNwqpHyYHs9Wf2qiWWa0PfgsqSEl5nH0VCBiewVGeGVM8ywjn+Rq+
X-Gm-Gg: AfdE7cl4NqHjaNVUQQwdgipGG2SjGEy2ytGEe9XyDg0zjFwVxppHCTzp4TmKOItLsDr
	4UYu1/eHfy1tsUuDpocUY7Yo216k/F0Q2/fQu5O2J0bffv+QQ+NXpKXs0uounLoqtmH7R9l6IiJ
	YaqVaYZQJdxtskYhvKX4zqs1RO9BPw9qA0MKAdgf/YH0v/zPGWx//Zs3ngN2JyZFrUCZbND8RZl
	0Nc74Y42Ym99P1Cpo3WdC80prjSn67KpdYXGNp7Oe7smZ4LDC5G0Al7upcgqXJH+Syu7ThDZk1r
	B675v0qeB4/pegXpSDPPyFww0zg8EZLPY0m1r23TqO5CqK6uM8TDpvDsw5XopOME9FPnWiP0vh7
	NjkRw3woMxnCnTVWHFaugWiTgPm47El5OndlxBqADKeVdU0hjRf037r81gO3UnA==
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792773c88.27.1782209140768;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792750c88.27.1782209140242;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:20 -0700
Subject: [PATCH v7 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi and Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=1142;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kVZW6MLZNlpei8K/F51SeFGWZUnYzxZeJH1Eb6nEyLY=;
 b=sJ+4ktaC4M6PlBcC3E/phsN9o/m79MIoi+upWAuG9RN/Bb5FHEfy0ywOUjLumMZTSIgMFVjtU
 jpwAFJqhHgfD0UweuaLuQcEwAJ21mNeDp5hNuTajXd20fcOcXOh6uHa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a5a75 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hVlIsfzSNREJ4Nl6LHYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 0iPJJ-z6txI0O5op-eRuPB4K1qN_wab9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXzMPZNGuhUxUb
 jCZ4wujGDi+qN5YAmOud2+4XL5WtYxzoZFQYLoewX++7iPObUYnZgcZWhosNofcFTDndpcj6CS3
 ZrbBxrK+LVk74K+9FN4sQgT75X6oRZ4=
X-Proofpoint-ORIG-GUID: 0iPJJ-z6txI0O5op-eRuPB4K1qN_wab9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXwlIXjKRmZtdt
 hT48dOFn6HnJ74gJ6ZFcdiKkhYsgTX4RuFoVVotQEGxMqiodJvV/7NP2aysNzE15MOQRbcNKPJr
 ubc+Bk5CiVoZeREQsRkCwnLHxMas6hw+HXY57ZjP4KoIVDKyTJzlkLDcv6qdTmVgJG1n98egXSO
 voTjjbAklotZ6m5lFYtwIgXENV5XNsMl3UmkBgsnX/T12xkeHBqEIeyYIjvgWA47B+RDJJ4BlQ3
 ZIgpQyPXimyj7DQUD0LPF48Bb1QxTvbAt2si73OuMTXxt0nQ6Ep/T7OnH5/rg0HMorm1OLRWzFa
 yyZ0Oj8qn1OrCR+BUR+lc7QHfVerQB0UI7qz/7ANCVmX58LZtGmLwqDA82p1c4O41K6QaYLHQu3
 V/m8M1TMa7MgJ7sBFUr01TktPkyP5i9KAVUyA+15073n7ZfW/7cVh0CMEM3OLQvgVHdj+c1md/J
 a9UWz/1NKohonYPz4EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230081

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Qualcomm Hawi and Maili SoC which
is fully compatible with Kaanapali.

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..8fd6913e414d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,8 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
+              - qcom,maili-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1

