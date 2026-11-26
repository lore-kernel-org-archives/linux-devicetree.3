Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688498;
	b=hbQxbiCSt4Fg3wTNeY9sg92bnnrOvagsPKbxqnzmVuXZfVAkFp+yuWzUL9Szk/6w99iE
	 rWVQPZfFfrQIvA1005fGu8A1JAU4PLs75S8+GQ4ATnb3QU24/hv/ns1nIlA+Qxs5qBxq/
	 xDZW1cg9G6nzs+K+Fu06vPnRVhOAzGF3trtCxfSQWadEYQYd1Ny+lxVaAvzCld6WGV9s8
	 9IifL3P/lezC+bHS+aJ70lEaT6HBJ8K+kYbyDPHYJx5He3rMiUP6kWgZsoUGG33ZxWFY1
	 yraP/7YD6w1yGQnWYv0TQTYOEk5nb9bBhAii2qdpkWLNB4YpqkRgQh/jIcESqYefeFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
	b=cuQbvLXlsyVp58ivAga9dWGm6n3z6x2oKIW9HcRt2XAgoKNjW0zR6Ei5aJNzlNIjI+Kg
	 X6ujt68/1xpnV47Tat1+IeE9rspo1mAoQqO8fe1SsDBK0SsI52X/GpVUnAr82IyD3WZ/T
	 nspcbDxayck2HsnSbG014bHtBlPbH1z0isr4NBimPqAZ4+8oxQy19bnnE0XfK4JTYy45x
	 Xiyn9vtAfelUkxrHnnPeuBVmzP4/tud/qGnoYAw+a5XXNVqoWR53J9H0eoKf+AWLThRkS
	 Uei6gEjEkmRfMkmiX8UefYE62itWO23sD12NiB6z8raMpkx6Edq2SmlnkKT6zbQieeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3YW2335286
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=; b=MtKophfD/5Z3lMMU
	r8YJ9EnDaDBPeuhGUDvY4hAmeFJ8m71b3qLt2Ji047XP1j8t8ev+0Tlpnl6pOD7W
	Fen2nhNwtYJpxS6hSQFp4MbdqjMz4C5phrpETqUB5+z4WNeJbau5DlOeQnoycfa7
	onF+eGonEOh7zaietG49+3WK5R89Xoh0E1bJ3YKWlGpeU+2YT7HrTwMWtLqiLYHX
	GksMy2G+9Nx3yNNI1ZDgPFwlR1aPhJQzy6VdnBdoUklghmYxv+ocn4MufJQPLBmH
	9bD84buRfIqT0wVswv2o4LY/diZR6DtpMCR37EbMMxa+niuM60KX3U8sS+CJFa6Z
	ne7G8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01u15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55bb7f70b06so118915921cf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688497; x=1796293297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=J2Ui7lw3iwxOELnr/3FqRghwlN7R9LnNHNEL7Lbs7W4e2Go/GWMwM5vZc6EoxHngH6
         v4qQ2KorucLxpQPzCgxN/nqWDdua34PPSziAa42ZWAUicjfYGgPxV6uxUHHkpJMxv/cn
         3N1K+9KM+CtJNzC03MML6Bvp4GOCShSgrN5M2yjL4NXWQhsIICYNX9+1Eys4PiIRu3dl
         x9Q2yJYP6AYRSjR9Ngq8pPc5IL3nqrABAVPzcdwas68H+YN4ViEE/qeFBckebhp7omPC
         2uPvaPWLhgw6i5gAiBqHvFnNRWoYl0WhOUOOdhIC3wRBcVMLgp2FjH0kvOJT7AFUms6U
         B6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688497; x=1796293297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=L/dlmJn6smblR3vmQ/oH81L4sBh2Ca2mYy+iXW6R+A2pnyRS5KXeBNz3GKAEaC5t6V
         B4b/6O+paq0WNXqi/S33SHQM03ydUtS8P6vJ/rHjRH4g3+0zTS7W9OqTdtGvMjjg6wjG
         Zzz9QKWqMznORMFKUWIYG/FbYvwQ9lJ9WWzpWd6+26We0hWbhJFVL2XBcManjni8y15k
         mbqPRzypNOGmh0tlhR6oW8gVrIjsb2I9v9YIvXVnoIt/yD/f5P9/FXE3gXtuekIGQKwX
         s1JNPJW4ueo4RYDyL03TR9TzvC/B4OtC+BEQtUvzOMezcW6arsnfu+rL8qUU0K4bOCc7
         QHyQ==
X-Forwarded-Encrypted: i=1; AL+hErHZa35I+QEoDsZYXCjyAsW5cSLNLHM4OLJYFDm+3iXc7QcOk/vmshBkZIqpdH8+bZlnDR5wWYrrM7Uw@vger.kernel.org
X-Gm-Message-State: APuU4Z9kbmt6uE4AOrBp2FdXKcbVMJpeF1WH1ivZ7NtkWHzk0XagUunS
	tIp5UQ2qV8X9W8bZmwRLcNU+fJzo5vAefEJSATxLM9XetOQIa8sVoGSrfP4BIdFlbpMES/rqKjw
	CyKPS5bvuF0Y2c7HaloeVySnJWSeRBCGnIM70/1ReA2rL6JVdAmFb1oM/PJGypklQ
X-Gm-Gg: AZFdTZeyXQfMQr/DL8WnD1NqWjmPSKV0B7z/PoeSwSlm1AL/ExvD3BZQOcvAXqT/jNJ
	upSyaMXVc0xJQPOzixM2ttkSkQVkz11yNA7CCTA2nShgcjbDde02BR7rxZF2xv2+wm1ZXqbHJhR
	1dpLPQ9xisIkK7eys1qZ1+h3fs6L96Vs6fsIO5JLYRyk76sk+0lDg08/tdU5rueru9zgZl1CwiI
	zmdl4BbvxVlcazn1qbLrjjEd9iI1Hgqc0BF98NKpv+qTHZKdiZgl8HYdFoqDEqyy2CPoqZqjTwe
	/AsFTZMow3//AMg19kq6a88iVio0vlkbclPKhn5gxbjecZKJr1McVW/275btHF9g+ujMCWljkkn
	ztA3t9WnWORRbq2sdJp58sVTYXKcX7b5uWcgsMw+WIXOn8Wn1cRGCw8gJu/UNWCsHY1IW/QMtz6
	9NfSTBfFPaJkjjjc80fhFQjsLPeruhkBjXS1tVkseS1jpHzBRpDzdcVm5uhVhaGUA=
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114313485a.41.1795688496730;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114310285a.41.1795688496267;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:14 +0100
Subject: [PATCH v2 10/11] dt-bindings: pinctrl: qcom,sm8550-tlmm: add the
 egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-10-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/dsb1sgncorSisEr/533isCV/S/Q67kIN+W0RZxWI0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUAfXCXUk9JKWIX+PPxot4wrr3TyLnqq2gp
 3c2iCK1XrmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w8JqD/4tlVYPJ2epuNXfctx2OeLhA+8n/0hN8gk7xHPrYnmErai47qkAOv21DFbkngCalRfgWfn
 MP26F86xxYngJtDUn7yHwUjWko6h2RqACiFdTKkLbLVHKfPp4z3anfhsgp0bADlFPUIhK0OSY0a
 KLyMZwFaHjqX+p0FBSSRDw/e2bFZYjrf43IH6k+RLN0pDOJa6IwN/Z5e3IYVIn+JaJiDYOsF2Ab
 6aYbgKPRg8vevcyy/C2E3PcaR7/CDUvZ0rCXAgrMFIYa63WV1DZIbaOhQLJB2V6cJoM9WrW4tFF
 6gQrXnwjZ+svOPKEE0pHhJrogMIRA5GGoJkqdZyEtWSp2KHxm0OnJTS2/ro4GsvfV+p+27iRR7m
 AnMU1H7koEhXCKdBbMYdV3tbBVoKVpsVEkUcyTRsIHg+93pWGz85FTZ1M38thHGhC4FiOW/Ckgh
 hSInK755Av0mGIj7s5+29omNXJlvBE1IVwU+M3O3c4Tq3/+iD9nDg1XZH2NGDrDzFFRIOvzBgoq
 RDffSRDvGzcTlkzanN016NtNscNC/aTlrXKcsEIH0iBGc6qTeaias9XT6lq0SvutWaCf8k782MC
 Sdwvs/TdpD/mLRTlCg3woOY/u1mW/6HJgrn9pO/f5St6mN9Eng2CnyWTHGq96wqnjJxAFvYF9sc
 6TYc9sTD7/JBtKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b080831 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nBsi83mCGTvHtYwPD4MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RE61lx7i4_4Lzq5Wpcn_X_uMHMMwGyAr
X-Proofpoint-GUID: RE61lx7i4_4Lzq5Wpcn_X_uMHMMwGyAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX2L9sbvmAecwV
 wWEgGm/lGxrcK/wD3Tw4UXLa8iqQiMWjLTquEJeAX0iOqENsMEN8muvoBm9WGT0AE1nEmZfHKo4
 wso9a0DqCDrXDnemkWtcS4TGk2ZWdrakZz4JAHwjM4WA2DZB+y2HQNFWKbIAZYhPM41EwCvt/DG
 epA98ZxrHxXQ4d4KXxeysCeb4AIEQj2Pa9CURgVkNuFewzjPoKFEMOZd0hJNoXPOPxREaEkLtrI
 3GU0N0dRkXkj+mbip3vhT0hcP+7xyjtwj81AaGozT95z8AedgaxEAECqQ6pJGJpTzljyqNvZZYJ
 vCN8ujGSCY4yirZKsBnx2AnjX44vG1kdbnVLgldvMHHnt3PSwQl4DMZPsai2Q5qMttnk53+w/oz
 0IdKfGBLjY3lJSc/Ozyqjyzc6oy1odZ7tmHddDD2rg1Ssw3kgL82DQFpUYZRJRCigbvJW+FEDwy
 RfVOSilq/5AwgsyYeLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX7OTfa7NxHeBA
 FxyOQK23eK2Tabfc41FCWSbLxYXZF15flPCbTRKKarif7NFWYAMsgU/as8VnS4UtHRT086oWKNS
 Ptfl2usCSfkuRdxqK9TpUCWDxY9eFsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

GPIO 120 and GPIOs 165-209 on sm8550 can be handed over to the LPASS or
SSC island using the egpio function. Add it to the binding.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
index c2ae79df424fda1be7f8be2b2c3d304df9040c60..8c0c677d7fd7f51de62d4cacfbd429789e04878d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
@@ -74,7 +74,7 @@ $defs:
                 cri_trng, dbg_out_clk, ddr_bist_complete,
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
                 ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
-                gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
                 i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4,
                 i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck,

-- 
2.47.3

