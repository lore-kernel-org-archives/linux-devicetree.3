Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897288;
	b=HwJgwMTTvAOJInYeLfqdUaxgR9tKhgqkle7im0eRMmjx5V1hbMChtEUh+XiS77quCMyO
	 x/DC+s7U9m2MMkM66fHqYu4RoRml3b8t7LlhIWvTTK7UUwl8oAW2dzEcGHu/Ol6QHVhIz
	 7u1Fb2L0iAaVPw7QYx5wLAZ5kRylIiJI81JqVmrfPvLGm3QiNhoILZ/2uKbAXKz9f2kvl
	 BMEcyBGpHAhTdnWooBManXnK7eAVS2P9+ECWsZGrCbzFOkFlAaHfbC7MYbOIAcEQ899MS
	 aIkhVnTmmNSTclkjRd+rpu+c8i6Xdm5P8mHL+AwqEvz12rxQ0ZyTSsssZZclmLBDwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
	b=wsW74MPa45Ie0q/Tqm/iurZpPhZGRqcWauYXY0XfOUAFYupBb3FHewG7lSA9bVat43ew
	 8C0NzNcJINqPqCLhosFk/SB4CZoWV2DwGLXSR8eSQALOmxLsrQCrKyhaIuMjJ4JABwnmf
	 nR/lTdr3IhYLXFN8X85gZctlKMjHiAAs0Fapg107doYP2IMILhD7LZR3HHI0YQXdReBBc
	 dF157Xa1UmBQ22KOkxuPhCURfOzSDSbKQbfn54g/mlN79dVGR10aq092JKSGS8mMrjdgA
	 Ip6mZhEzD/8hLLMrxJ+4RhnMaxluPhSw/E9GIDrUYal5CpJzaFucXzgHKXTevg8Z1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E301606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E301606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55evl3350043
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=; b=hplfNUYIrkS5lLFO
	ikP7yKjU66vTaAm9iesw1Yn8ux1tqMu+ZSv9YcI43bs+11n6DH/h7euySh5E3MPr
	kyPzPP1WdIqOJTuFuUEVAnlzODtvdEn6tLeBjPlqwzf7Ha+Vr8qKhMNjARJPOWcc
	qmKxyTtTYh1ljlXBl7fxqr0cEJz8mjs7VuQAm2pOm3NatvpqAIutMOkBzTmvfIyz
	QFsM4VjfsA9W3e4HFCG4bZAeiu9TY49vUb+HLl+PdxKIb7ZsgTM9Yg7biagtVLMY
	JJVXwxpthZfjZRi3dxJ7JI/oJtK7BRqkZHR2M2Pgjn5jodvWIenjz07fj2kMYiBE
	LvqjcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr09g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddf34086c8so1262037a12.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897285; x=1795502085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=g0q0nvYpgkL78uUZCkBR7CmRT77W/W0ugpCjBAs3P7JIFTaS9QM2LOT60Wu7gKArUt
         NtFOukgSFMKqRy4H1gVhpZj0sx7smCGa9W2AXZYZsgMjYWZuTKfAXsh85Dl73sMsmO7S
         0F/v+XYCBMATDrekO0Tk6+cjHYocS6rWKQp6+1FPOvYLXTLkEHEB7Fd0rqrFwUseIx6X
         c/8NY5qU0TqJhooHmMGeVg+DdJzUBWki5jviRC3TIhX7/S1cJFyWodMQjPSGfSboYbn6
         oIS55HIJc2/Zts6WTq+zbxu5rRtVtBQlQKSjRsvtB2p1H+AvXMD4MYiTZRIZ7UOirha1
         IsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897285; x=1795502085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=On5VptDZxJjHLHMPyehL/Bnd2SEQF4USTI1jECO36oMjNA16NQNhqoDYH1RbSOGJHe
         q0o9QBSspOOSWnjIuGVUIYqMLta06k0WTfrZK3I3CvjLgHtJPgZDfUD2gX5ImEwLMRU/
         bnBa3nhC6N3Vqe7s/mZrI62KS6R83+KLczJT2d3Fv1lNQ5mry41KBnTzkA4v0cQnSLRQ
         7ZKF47FuAdHwcjcMCvlBJx0M6wLD38BZTJsYJnhN8RYRSDEGskdCVnPYDZ+uet8fjKkD
         Zfm2uHNRvWofDL/N0FPMFxZ7Kug8MbgqOo65hw4alJDoWBfeLml0oLVwQaL8Vw+L8jWh
         S2dA==
X-Forwarded-Encrypted: i=1; AL+hErFzPwxlX1A1t7qJUoChj5j7wnS0ywAYNlKBYucVVnXDpvryTtj3CKSODjh/k6oOZGI1D9MN3E0lDvgb@vger.kernel.org
X-Gm-Message-State: APuU4Z87PsK7D83tYVid+AC0tHr2OvBteorTqzxPoqJBLADglNQzZZt1
	JCQw72QuQjvBhX4SSPJkqG2947hVRSJXu6reF4LKbQhbzs0b2TsSALLm1OrckdUUCsRPnxoXj6a
	pYWKcK/tdVmfm0P5AtKh0pDVuzTTbwFcHkIzu4Gvvihg7QrvK+B36QfqiQxp7eDhK
X-Gm-Gg: AYBFou1UX4aJ8sb1mV5MusOaaR9aC28Ov+l9YK+LcIeDUgl1rKxjfKMJE/K+EnOCKDK
	XJc3AV1odJEW5CH0lok35H8GyI0f7Fq0MuHHcVwFsApI3Nwm53yDYCx4Ais1xzZWItvnIoGYNFy
	EPWcEWFZbJ5ujQWv2bbyy22o9Qz7mt2NqPyrodltpqVfGEn4J0fEGvmjf/fs4qwVhV5m6gxozw6
	7V1/xAdeKcNCVJj2rItA5zK1vhjTn4g/l5PhMP2FY81OadxmPdx5Je2N36s/9mvMHBT/sZUS3jS
	+pm++5vs2+VqwJahPZ06O62i/KceqLEbxhU+k3XRs9QuXdyInsg1yykuwvp5e2yicIdVCxC/+d9
	adYtjkx9ubfY8MhcxvvMCvfiNCZZrMjNjKbJi1DE1MyHl0bt8kiccwyDxI5U4tmxvJgBVaDqqH0
	aQp3YA/0qRqE7iJuwrXoL/8V+9AgINSBjK2RudEYd99ofWFsHC
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380191637.57.1794897285511;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380168637.57.1794897285029;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:44 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:30 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add_iris_for_eliza-v3-1-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ERwzmO8/pMXME2fZDOM0QI60W9iJpQBHJoJKsOsmInk=;
 b=QeYf3Y9llgzNBkc11s6iVXzSN2QcXuqIUobXrnbe8UUkztWuA92wv1c2DE4TppWmTfDYWJFak
 xkN0cNUbYisBG1ws1TRrhH5x/9E/iGAZTypg8jhwGFBgX1JzFTTosX5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afbf586 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: YUKwksvYBqaXenAorfBxulf-5Knhflgd
X-Proofpoint-ORIG-GUID: YUKwksvYBqaXenAorfBxulf-5Knhflgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX5i0bNeFY2UhZ
 bLmzjcbxKz0ngLIqqSmnv506xmShm4V7ETyHzNbjeiOA3G77KQtOsT67CJv/ykwcTmhLy7hhGGg
 3Lfs2Rd9FYSb/FJifyE1VWtMj4MGlDSFqPkQHWtgsQZefY4xe+I0ksZLtAO5nyxrsWhx9Hpgu91
 by55H14ngKLwDaysL3tq1KHKV43WjykEJUZBpOFrPnLc6t4YUstnOhLu316iGke3IeJmZscvOnT
 HK4XKlx55oZpQ/v/+ihbMha4ENif03ZEgAV/V/QsnrcflAl0pMDMmhXo0hK70C5MTJUy/ERYxcW
 GmjK8ACQoQcn4ThgSXSPmyB9jJ0uEfJmwFXpMeBVep68RaKPvL68LCRPdjB/vObKcMC34ThdE2Q
 zP1dJRRWiERvJjykFKegfyD7hhOxtEM8P/NYu29ownS4EkPpE5ez9AZ0uXLnnQyOnS7MiKu5hOH
 iT7UtYigMiwwRjVq3LA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX3HqaZxt0yJux
 WVLS5m4vCQ2TG69+Js0RtpsCN5Rk4AbgIK1WBfRQnxPBESd+Lnqy6WwG0uQocqqro3aRgNGixd9
 INyeLO4LrEgyl4Z2Aqw3srsjOKuKjo4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..e06f2d844bd2614f6bc5237e3a246056daf28821 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

