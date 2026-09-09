Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960952BE41
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951079; cv=none; b=KvU1TGiioArZ/zNokWPRVfVFhl+X8y22NlxLPngAZNKe6cv+ycZDD/mfJpErek2veeK5InCQyBkn+RvD+zn0RzqnVfEicIZh/tswgZ7R+N69GsUwT+a8iSeswb+KkDHMRsxy5txmQGU8pzq0T3zS13j6MZbTwNMCgvFUnPvEkx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951079; c=relaxed/simple;
	bh=O9f6hfp0eJOnXdSOlQWDVVs/akRlJJL7XlXjA7mu5GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhV9/4OhQAq/mzlPu0ZDq5OALWw3O0xGGJ/DMxfI40/x8PlR49aYcWbvmJnZjrDTnGZGXbTdLcPQX6ceqoF0l5dRFNKbg1O8n1o6rpsF3z63YwvTBvWYgIZ788MKnosz3Dej1C0mO/tDUX0zSJHwgKcXKz7emPcvIfz1tLU1iNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpPzIskl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoRNpxJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpPzIskl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoRNpxJ8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AU7dV2243641
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s3bU5CVGxsB
	pdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=; b=MpPzIskld4wNR1Cdu5P8xe6rK7W
	J+A8vcKQ2RUhqgdW0YzhYuPcpeKsy8VsesdWiUeeetwTZwfEfltTPdj0GTvDqnif
	8NlqUH4nGQOvltoxyu6UUb5/tHDzudTN+IIYJGSHm60mdfH+RWXctLK+mJ/sYOwl
	mdOkjDgIIqE+rJP3CPI1DXX+evHekV3V41hoToLF73HJebHNiXhAUMZOwv+dBtrH
	5FLDJBhsMoq6OYIQhRa1OPCNatBeuEzQHmKTOYDLmDD7MHLc/yyalO5IOTMZalnj
	im2OHKSnR1Vo8GuGv6KKHuBJk2BPEZDpPnVX0E7gsq5Ent0I7LFJXSg66hQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru02er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 10:51:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso6760010a91.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951076; x=1789555876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=DoRNpxJ8UYBfrTbAJdKIT6pcJVaXt4PE548Je3QT4itHQm8yOx/vUea2+NcRb7iHqI
         IffipotUAGAnIioIdXsMIBkRCmP8pwuoV/tmtsfGnlTUf7SOCoLfYsR/OBcxR9QjyONC
         l/vuEGZ7jJbtB8JX3YLSeIA3jqBt8u1E1t3G0X7qprVa97pM85090R1+QiP+9DwUs3+N
         4tOG01PKaVt0JNiha0eDpM+gF7z4LrCl/bYn5zm7Dgl9LFX4q6EmhKoDs2D/OzyVfLhh
         soucEeMRYkMKQQ6NgwxgGWML+4sbBLP8WP6aDm7NTm61CUFLw2p1EUKb4JpqXk+BspHX
         F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951076; x=1789555876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=B709sta1HegeTJ78uh2Bo93Ip5e0Rvd+CP2P+R9rG4j8B13EW8qPE4r3yb6xJgMzr4
         GK7paKiyCqCpc57Ral63eBBYBN87/qs+jzLUxZpnmVMuEEyB9maD90hrbPnuJqkrBrEY
         xpHoA4j4yPRC5/9v3TdPs5lZwIR6SGjdUbcLG6gbTkl7o6tPAUr946BlTQCo65VSkGHi
         FOuN560awMlqFetrTpEkMUJbhBr4+RYFk+FyFF0uV2XKv59hO8Q420vSJADW3zSu7r1T
         rZHbh1ZFFFY5SbYJ0AbrulqodUwJCQQ/yHj0VzNKX7IOvc4EC5p0Bofqb5IbW2FzNsqc
         APQw==
X-Forwarded-Encrypted: i=1; AKwUvBwDV8SyudGm3bJIGZf3+Ee0TSZM94n1mHtuvTCjsE0z6NQzS38i8i4l09zsIlpd+ShPFwhrJvpnBY6z@vger.kernel.org
X-Gm-Message-State: AFuF++mm4WxC+w8265xYnjklKjwe4Dh+6IAwtUbB6fDRUn9T1wZaY0Bx
	kzUlbPwrk7+oGhhR27DBattrz427+8xlBKbq5ePAtisWOrhBAxCL8T1JtDHw+aGsV39J3aDaul8
	93oVBTmU8IQ91p6a4ZC2yVy1uBKxuhc4ihDdnmBxNp7OpJaRLhV56oIAKIM/6apUm
X-Gm-Gg: AYBFou2buYA5h7rZ1E0RXS7Iw89m3Tg7dPnPGw1+GLvVmVd96ktW+Naiju7s36Wl+ja
	Hm/BCwsFxBRzwWINZi6OFjwHgf16VOKgkHtuYsb8i8TYqAiEptI7dQQoJMgZ+38dpzapoorZ63G
	6o9iFRGmdS7FakIW0bftpY92l40RNIlKtymthP/rLb5t5wwxtwTJ5xu1Y8PWqz2f/DTklnBg2DY
	y9bxLsqhvKQaJuDdDpYghSQUfBKkfiuzEw8wmbR/UqLfvNdOUVfWsXJraRkWS4skjUr+J+vzBni
	lkFhPBwKoqZ1PHfUg+WVbaKAc+aLBuLFgTSyq/dUTLkwRir6rNyEmmlevZIhSWdDY6efHhbcoLS
	4+StKsuT5cPhk6CPjWPeOCF5byrU=
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223163a91.22.1788951075738;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223096a91.22.1788951075144;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Wed,  9 Sep 2026 16:20:48 +0530
Message-ID: <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa13a24 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: v3AyP29j0ywhBB1J_FO53QSpkpaXbbeb
X-Proofpoint-ORIG-GUID: v3AyP29j0ywhBB1J_FO53QSpkpaXbbeb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX8YI3hqscLbUI
 QUnhmdfX8gaeZSzfmDonbNB2tZseNrtnnsJD1mAkTC8Pjw8S94E9eL1z9HUQtO4Hfc0YtqBQuOK
 6V35JU/AyOco1K5PEg/4N83js/nUR7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX3GUmPeEeNXW8
 r7RDN7TXCQy7zWFCdp+dZ1wK6b/m5SC1Dadn16BxcSAKSzwvbpcOjVdsSTX36VohwWODdPL8pvj
 YwgXrApamUJddzaocH3PjkFN65nYAtPHstNvJFAOyBiITUyrneIIDAbO/h4iwAkDcQsaSd4dX6e
 n/Q5mLrkgFL0kYFBAYkHljFFnuq10s37GtJ0ANDKcF2/Laf3ohU8Kd7gnygsaYmjdQVYwEDdflS
 sHt27k9Ycw8G+r4f+D+KpoXgz3x2pJnllLWXiMSxjOwz0zGwphN3sZt4s+hZ0AkCunlBg48qw39
 nozhbl/5gu218R0IsRTgcUPM8SIm+czwAJwxeG/wGLQAqtbJVmXXB6pkowl1Hq248BlI+c+n8zh
 FcIbS6aTljlDwlmWwmSaEovME2rpSSRMxtIsF+7wC9kIJrJumK7o7V5Mz9hK2P25HnmnuEi9WGo
 hh95zEGBWd7Z7WI2yFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090120

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

