Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608297;
	b=BEoPxa2QYNxYXRvSMoFBN06BI+QMXGZGXu3RObiVOni3pkwHEx4eksIF3MSZT6/WY4Qr
	 JBwfzh0Aia1IEEB6j/RqOmypvxXKMgYD0FUVYScdc03sPYLRQJO4WZQoE4JjTPXkam+Xz
	 Rgnw3OOcRuA3wsGnGtJXwOHKL4nBhYvSrFb1Z6kC+OZIpm1r60Av/FlBVIA5DPSAdf/mh
	 yUxArPH14bF/E9xPuWnNv5YNGfzuYc2oM0qwKfKvipCJB7wX4y+NTfTlNZ+CUJ2u/C4Kp
	 Hz5lPD4hclko2+mcUInr4A2ajJa+xnfTAXVJVPaFQiEep4NMRMHmEnDdXpvMjQPxWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=IJjc7kN9RuDrrdH1EZzAbt+3NOMSyUXMsfKFz+cpdXW3cavZ7bJpg8FDkVwc/tRgIkA0
	 zv4NayuZTqmwLkEkZJUzbRAFoPvidlFzXYtCnto4/PjgLE1foYOcGkdJDlFSeEyYblUIW
	 PXBWdHVqvqvYDXISWm04zheU4oYLI2YeMB5BZ0GnaunUOig5ZgO/5KlqgYGkewR8KS6cv
	 P7osit2H7lp5VJx+CiGEmROMO1f2DeJLqJyzgtu8zIjogbzlPydnHyyV9AxKi8qbFBWLJ
	 hcDIyGYoBxLXcfUI22j3Q5TN8YpuOfw/+BOBrY8jpgsuF/Kc5PmMqpKMIFKUhKaF7bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6CE606A339
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6CE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CfYd1811682
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=UH5DTolj19deutIT
	zqV014fRre0CTOATsmQMidOF+cXwsQAUpJLZyWL3MMotWOYCfN2GfteVrwCBENLn
	IcueiJ/blXe5WsJ+yJmHS0dtO0x3e+CWP5T05BiyUA3jJt8hX6lxrGCfm3MsEBbn
	2OooUqEidWZMeSdIr/f7dMDHNOUmZuzKOm3REgfJ3bAxyHZtWpCp+PopXmDooozC
	BIkvlLelEZhEtJA/dFt3B1NB92KIBU3x5TfvMCrR863VSbgi6CFZyFhn+HxNEe9W
	6s6LvuhSBwYD6FQXS1H/CWE/NKetkc9b4CkhG60DRS0/ipQ8J+sgZnSxEH+tMI9F
	/w3xug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgub0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:31:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0589ff620so1787755b3a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608296; x=1794213096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=KmaJdOPfAhZvEObh1AKcHgUdQBIMGTiVbWs3AGO9qNaisNzlhajryhaseCbQWOyGWi
         v6Kq2sAJ4EayAygfasSgh3yd3dth3MfpImmbCkxhCBBhdO8yWtg8UKd84GHWQSMysaD1
         iwFjCm0AiID00xpUPy+djWE+7Pgn2O2HW8ZSEHjB4j4Js9l5KJQIJoxiD2v4D6TEWfA9
         8H5/xIsZ9np0oK2hbidfbSO/x5/jY7Jq5Ftf/bMYEXofhg0yAxrH1vH6gRrmVABxW1GM
         T5FeXe80vgFKNsAwFa6cjZWgqgAUPbqoAY3nCBlN+JDBAlxryhqqZKdYpStSv8qnTcBe
         E9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608296; x=1794213096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=DUpAYCzlgd0WgGSGewT1PIbz/Y7h+C2z1D/dT2l6DSoxRp73pYJTxrcE++W7KMQhtI
         z6xoKkd67cOkY86kN7F+IJPPqARYgj0usRu6XOPC3i0PnbQA8CBhf98OChJZZxVCDk2u
         NMP9t3u0PdGWIydbQDM4dyhiHRYFGhPYVxCJy62QwZN76h+lAaQHPutHf2ofJdcQzCEK
         J/f6/a3+0letFhUIANQGO9o7DtaCtuwu44u4Bs4SvOvR/7juzhHqg+VpFr/8UyWw8jQk
         De1zJ5I3Y6jrPpCNVrZddBWYy2sIMpk6cRLD5xQMJ/M0qkETG87XVnhz757hNs0AR6AV
         kXDw==
X-Forwarded-Encrypted: i=1; AKwUvBzmPnH/RsqCEp36s/T5Ir2CR5wBenxMchYVyE0hTAgoOYH4sYogXSHNiHNRKLGMrtUvUIDQ2R9Q3sP+@vger.kernel.org
X-Gm-Message-State: APuU4Z+6AFEldsuqP+pyDr8hfofrwSkvt2eKW7capRTbwDpIsCi0WbYG
	/ae1MdvFMw5419nijeeZxMHrws6QdlQFXxzDIzju22ZN5kvdMaFIDSgR/wcqH+KQMJUCXj0Q+oF
	6BWI2uuHTbgxB5Fyrka+JSYfJ4iYrkwk2fPJrwko1hJzPofbnYLYbzjlwIbdnDBpA
X-Gm-Gg: AYBFou3zTwQPgpDnn9nnOwiPI1Iv/Go6W2OT4oSooqB0Ho6t1gCOGA80dCXK0T04pxg
	kkAnL9eKEqYOxLL8BQlsj+EWjHzKIjQd8eaYceozz4EeLEEAGfsNPeChnYdHobUeo8J11ml/H1K
	v5MCrxATTXMpkXQtn6U61slctHfxL0Z0AYo9fRSrxHCPVDms1C6Mdzo/lswfo++fUCgoMFXqHTi
	w8ZtVoUib2BJv3zyRdkEA9lepZEGT0Dh1GrjulKi0vPP+gK8VmluC5Va0ZUGoNrAaNMzkYfFeqk
	KuUSrgxjD9PDvf/PDZmhOvFjCED9UNJsk29yjyU5k7ZKinn5egLb5KLcYN1Sg4LXSKsLR7z7pdy
	LMNQhf838dXyJBtB+qXfwyrJQcJ3jKVb/klnfA8yfQK0cvg8qygtm+F8PRC6W7ThWKfzbGR6akP
	Z32YbY9Q==
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706596b3a.51.1793608295747;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706584b3a.51.1793608295268;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:34 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:04 +0530
Subject: [PATCH v7 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261102-dup-sessions-v7-3-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=FTJZktJO19KaCxSo7At3dajbxHwj5iNmGTS7GVKlisRtVjNR01L481DINVU3y6D2KlWjucDwf
 sF+z9zbjT1jAXqJezx4r8sH7crhXH6OBi2c7G839kRPj5ew0dIvVtBO
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: VzSn3w_KcTw2oP6ryBorPzHBqfwikPLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX2YOAl20Sg9Ng
 ysb0tXeGF7NGwkVGWHfG3OfRmkT+9sDGEDDZjvMOyZ5bIpyQBYzsaWtPkM75PKKRhf3Wanr8C4e
 XHHw1nCQpg24uJk3T+YmIcVcT/ZKOHAAD+VCGB1GUEVIpOtNqcwynI16vZySx1DhHyoQuXckBMF
 JlutGS9TzFVnWLDNKC38396DyOCwLS+SYtB38tQ1PUWXvdJ3TuljinUBj4FID3FHJfJQI0kmWTU
 eCzgQMnnjEoguJv5dZOyg1tV2donfxdMLUwdE3HlCXYeYq8849Gjh5UnUyRJE9pOme2PmD+7VXR
 Yj9TgFZ4vSTka8ph3YT7YFXdcoOIZ0VxP9GbX+DYiaTvassqkwZnoL9g37E70sL/uMtHnvlfrbF
 +Xb5Lgt0OQ1CqtHFvfP2cTdRPnJQcl24geYtKxeb/pUVja9V4wSf6FB2g2rSlj2zfmxH44F6vA0
 D20Si6QyZCpUBgcapiw==
X-Proofpoint-GUID: VzSn3w_KcTw2oP6ryBorPzHBqfwikPLt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX3cI9WM3N/qEt
 atNFPFaE3Tm4vta5BIE+92K2VssYf3RutdRuogmwHYz0He4v2ycXLXdYbwPAuelAagTxxkPDWyZ
 OMwLjV5IHklyp6IepXyRQWH68ElTZ24=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae84a68 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

