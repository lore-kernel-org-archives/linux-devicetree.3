Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3133ACEF1
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449317; cv=none; b=V26vtbu3Nj2MsptGhk31Llt4rjCG5NNARGRryIx7gHUoYyR4yb3oxUQeYZVxzhugC45+nJklgeauHAF2s+V2T+IuxvUHehEMWYZS434uXOOBhx2bf3RSrLg7I4/mYJ5ISwEtWmrMJOFRnP8MVl7Ap6oGrtAyDbBhfTHDrI3wy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449317; c=relaxed/simple;
	bh=M38zr4UDDSTutNGbAEBqRcN/i549+qASNFRF6ZXlXao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GKlU8lHLNPDSA51n8jHmzwYdfcuT/YtNYx4Wn2o/kkgmJUhgCv7Q1ZZxliOR/AiBvmbz0wDZB7rRIHv88bs+rus2D2bmcKaLMaiwt3vw+v5GY4rYwntE9ZlPVdQZQp88ppFViPeDYvdNrfI/CzpObjvGN+ZYmXdYPK5GMhrPKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alXGJfJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LA8qK3fw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alXGJfJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LA8qK3fw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KX0p1170011
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lTF1ykEwo5DXZWlyE50I/v
	qpScUvMcBObYB/UQq3D9Y=; b=alXGJfJJsfyOMO/kf6/xMm4Yr5Q4gP5iJIqCgZ
	6MAmJSknJQdX/ur0aYRLyAVegkWSVranv2SIvv+faX4DPQjsIOrcZtqgTifd5sYv
	js6o7IKgc+dfDbBc6N7lDLhkXUlZccugLGm3C15pe6bL0SIcGoQXmOJUSLQbWZwA
	wdpajQJKjUnXMhwYx2czUsaus1e2JVKCRa+0fgJLpxtWCp3FZhbBB9kXyFiVJtTg
	2KviL7vT+9AfWad3J8nWyqOiIyLN6vwSzRiiu7wEhoVbo90hIetximT9QcPobbdG
	0M+Ozfh5jnHaQTlQsX3JyM4exrH9N2MqNPk58fiz4bWTjaRA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39yab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:48:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so14564677eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449314; x=1792054114; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lTF1ykEwo5DXZWlyE50I/vqpScUvMcBObYB/UQq3D9Y=;
        b=LA8qK3fwwutnGy03328l4YoXRmOsQvPO0cDn9rngUj6VBFHRM1X65XD2SZR/GYqw/r
         F8AKo0E8xKy3gJh8Y0821196Dcko2ct60CRcwPzHt6PFOFRHlZrXu1gBzdLsRApEOuvU
         fAP+0YegYl1Q7USzJTv/ox5QbOPyE8qGC8UcwGduzLfQ8pImeNlOJl5V9MExF8Ud3Uhg
         BymHEJ++Sj018bxz0/DNcXuPrq/nESq6HkgjSaKha1oqypg6AoeQa3amsZlbsVM4/EN0
         /Vs4HsDP70fF/slitTd5wqhthsn7PkbV63lGEYNjND3wgdizqkAAm69FLu7zJVcUu1rs
         AvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449314; x=1792054114;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lTF1ykEwo5DXZWlyE50I/vqpScUvMcBObYB/UQq3D9Y=;
        b=pYbzBxVPE2ZLSiBxrbJ0K6zJWYZJW+jzySPfuKTO6XKT28uWlnSY2NeKfBYg0ia1CN
         WW1Ky6vnVnPcayhtZ4UhCQjpgoEaMdLugwowr5r7Aa+9wILQAdmNHt5g+TrEgmaPGL/2
         127GrhnNA/oPlyubexURSTU7Ddmx+DRu/Z3zYdVfYrMLJHjeu9+2gaM5/S3+34Fr2vIp
         LFnAn+ashs8BZjH9gh/4H2KjgWrF8gB7g3KAXayG5zH0jSfJ5EGXwoMB3TthcAeS334J
         9SLUvxtxmap36gsStjdAC1Z1ewDT52o1S7BC9HQebMgeyKN4T/GmHa6EwYQ60HL8sx+z
         0Tyw==
X-Forwarded-Encrypted: i=1; AKwUvBwM+qrlrG6vvnpXeGAtodYtfSZ91r1ATHbLWrw3hpkthHVnQ6Ob+N5LJTqQv/7N8a06R/1fMY8apaSo@vger.kernel.org
X-Gm-Message-State: AFq9FYLMLu1y2QxGhiyzNT31i69M6MmwVa6mTcV1ZuJx6qN7/2XptOd6
	qH7olbbPsbg6igqQmNT2vetVndfBMMLnVCkOLEDfHvWvW4/e8KySSDkUkZ/i993/oVW/Cbr9eB2
	0+FCM5XdxmTdcj1XeUYQmEauwxA6DSu9ahauUFqlgLpbqxOh26xX3s9ZWnds6FiUX
X-Gm-Gg: AYBFou26wZONnr8OxLq9xr6JRNY1nzZ0RJBmFHsc+NgkGklST2l3+IwNzF1BEOFhO+1
	Kr9CEyqJznsaQ74iqxABr3m0IkvwAdIsqk1JzcwbKCy0zucHKrW0mGF0EOIOhzT9U5xf9qPMQx1
	bMkYiRrCvXAnruSJ57WJCF3Gw0gMm0ZxES209alvZv5bkGT91kXzilSEDaEJygXVAjTykah1mcH
	7owzzTeM8teLq6DfvFaMYFg3YoJ62lRwTihDEe0r8aOmVYoj1ykFw0VVViI3e7ueaqzbG9NvXz3
	ekZPyXo+gYFCB330ZeJDBPLiPHez9vlSRDv8HR9JSsbDHfwGh6elBYSJuhAnJTbqSoksHxdfWIp
	VErH5kJuQgJEoPXNuTetH3xsLTDrwOqC+ccS9LkmH9YHxxbPu/L4uJKvds4pk55wKKPIZeUYFdM
	sU8Xo8JN1ooKx4Fngzan3TRk6L3ZgIpQ==
X-Received: by 2002:a05:7301:670c:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-3515de80f23mr7606195eec.9.1791449313195;
        Thu, 08 Oct 2026 01:48:33 -0700 (PDT)
X-Received: by 2002:a05:7301:670c:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-3515de80f23mr7606146eec.9.1791449312571;
        Thu, 08 Oct 2026 01:48:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm15302755eec.26.2026.10.08.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:48:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:18:24 +0530
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document ipq5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdYx2oC/zXMSwqEMBBF0a2EGndBEvxvpXHgp9QaGLsrUQRx7
 wbF4X08zgGehMlDpQ4Q2tjz4mKYj4JuatxIyH1ssNpmRuscxY1oijJpbZqkmS0gPn9CA++38q2
 fFvqvEQvPCG3jCbtlnjlUytEe8AWhPs8LZjHjD4YAAAA=
X-Change-ID: 20261007-rng-1894b2545628
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: CQgjUPvFMePhFiQbOV-GTL-cNLdZMyVi
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac758e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8y1xNrmuCni0Qpi8TC4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX+hjmEzRJtwHz
 nkNul9kC6Roal1oSnBUy8qNnkiyQ3Fta+JDatDgrGUohP6i/z0fpKB4yjvb/eAu5lOc4YyjhGr7
 Zl+HiZ+lpCX7jDbZ9VdBOIHO4kPCFOU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX8Rm4S4ta0uNp
 FnPmne/hDX+cox6Q/afO3ffgQ3WVpogY3ORUV0Lu8cEBneP7kQRlAdMml7j6xiXdMAXNPJisAek
 nmGVRRKZILlkb2+uCZ0AYoFAaAnNQ7bRstksOZwr9Ykox7fkjjOkCd/cAxZ1s2DHUVJnwSewd4R
 laqD8dh0ueAljXJSChMSAObdW5HyWoUJs3Gxsi4UB7livAwhTK2ujFsK5mcItaTHa3RLo3YMY/d
 Ou+fHrajmYAaZWHihgxC81JpdtJ+CDRSAWOCTG4sy2dsj9Inh+K54qr8BygICYJzkjdYwcl5knl
 7Wh8EwmsT4wmMBd8g86JhzJ1W4AGaXbur5/dKwa9EIC2dQzMpmcZgRCPIWMxKRDPcD3tSfXSQMX
 XuyB8u6F+H6aupuqJHeQMS+CUi114woXAzN5Ia8I5cUCRv7D4HtM1pBI0c/t24OQbWJswc62rT2
 v2rBJrzFOq3XB7EAA1w==
X-Proofpoint-ORIG-GUID: CQgjUPvFMePhFiQbOV-GTL-cNLdZMyVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080034

Document ipq5210 compatible for the True Random Number Generator.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index de323969fe64..2acb629e816c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,glymur-trng
               - qcom,hawi-trng
+              - qcom,ipq5210-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261007-rng-1894b2545628

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

