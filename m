Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565217;
	b=PHfZIqv0x8V6NhUucD2orVDAglN7BEn2HFVuCebqkHNIkxx5aX7C0RceTfp9muffSPFA
	 1noXVRn3FuGHzbdCiV6l4cVdzu5H9exC/enpqju+0ciHS6E7nF/a8GAdKzvqHCE3s1AVP
	 CxoFGGEk+zw/0hXQY4/kQ3UDIR3CTb6ol4pkCdPbP/AhUQkBraFL6nLTfwTyQFF0JW4wl
	 0Wmfv7i1aPvSKMhk/Ryt0gutdcl/8KmwpBDS9WVaAj9bXX23FEHZ2kzTwabPGVfcU7fhH
	 IvABMLWwiBSQwUuUT4qQ2lgYCh5Jrf06oVJJNP8FBr+fPI8mbqAPLWovzoAWnvcKkFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
	b=2KnKOYdKN6p0Ps9epBK6HqEFkDdYzGCeomvPUuDVanky77cr4r/l0OI5q/rDSd2hGdXm
	 vPEL0fnyoiI6F7WNyPGlMtixgqXQrhnMaasolCiqFuKkIwNjpopxq2VHb0BILI8+beT0m
	 wFpQ6tOVNOiXrVElr7ITLqn0YYjQDXrwtylaVzyqqmXcUeIM+UWE0el6bJ5FSlKotbHcf
	 Y7B99hpKrZCvABIAvk4KLLa2ptiUkmfQJuEjstQlD5voaBlQSnLAvw4Mo0NRmPCBOEJPc
	 mbyyDmJ2575Ej7S1YWEjmyCv6e+0Gg2M52r9IKlUvhb3IPvy7kEJk4SYH38A7J/Yslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fri0xDPv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0oz6rRo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407E606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C407E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fri0xDPv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0oz6rRo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMatt4640501
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=; b=Fri0xDPvMdwITMwp
	+bydIZrpDuNbf7OQkwNvzYyc2j+A400KekCCNNLYlY3tn17LNhJavm7QCq6q2CKG
	64MGxx97JdYg6mo83SeHkdktKVMkog40m9KPq0awR4Lq1d7raaU6/ReCC0ifMBfA
	tQzDPfBDeUCRfHwcY3yOehb5YO0X1/XhizX8ahhPlWL9qjSUppIGD0Ytvu3uOUNj
	2su0Y5Uu7kqV31GF49zCWfxpZHYXLagsSuOtQEGOG2b0cwjg6njngIdWbROQRV9g
	YgUazp6zU6Yi/aQl1putHweeh/QPHk5EVuOMfas63I2OYtAAM772LJRKkXB5xQ/A
	5p8SoA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsjwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so6243101eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565215; x=1796170015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
        b=H0oz6rRoJruOx7wG/qZcjxVV5PuYvGJk6+J8m1T1tQq4d3NFCOpcS9kQK+u9zzChMX
         4vVTotOvmskwVcCUO6Fv6SMIl45m7Hnd1C3iPfC/6WUVsOEUh8r4AKNJPqbJ+GneKYGh
         4yc2nlf50YVHGFMOW1R/gb5MuuwxftK364Nl5cJvIMotWHt/oNEZH+O6CtDKCbc9ATYV
         alFrwL2nCvSv2o0H3Ss8D+VfXrSn1Q7zMJd8U2cIyyEp6ZvHYfYU/8oHMlUR3Kp/ae4P
         c7EMSA/ycc8kjKLfgTj8jno27lXCLA+hOX/oEUQkiFqFBqQqBnvOXDv+Nvk2ZyHTWHQW
         8L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565215; x=1796170015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
        b=zoYS8o2r4ECc1vWya/l/ZsI7WaS+z+9Iy1Iq/7WR6Zp4zCDjdP82grbYOFO8IMctQz
         q7UhpjqK/gIvKtJYxJ7PypYas8x9p0Za51h2sCOWcUz8YeqoBivJDyvNr/eEshtvxtAZ
         it95UXuQ3o+keV0mMo8WzquEqo/HphMcFJJDWglaijg///wPprcLnMm6ON0DUewbNXA5
         HO8vm1H6kcH4peaJFbMaupXSVSV6j4cd99FSKK12dxlZbp19KcXaPP0jy6vY5QdZ7NwZ
         17OqF7tVtUN0bkEdmRTmShm7v2qjjYhmEY5fj1mjeI3J18AUbrmz2uqhC84Nkdg/AZLU
         OoMQ==
X-Forwarded-Encrypted: i=1; AL+hErGamcdEKxadEAEx74qJQVfYd/LNRj6CJsh//OC5NpQVpIXYgYvWtUkajjODJQ/ZVTMEqiNJtvMblBu2@vger.kernel.org
X-Gm-Message-State: APuU4Z/PKtpGPWaU85T1oSLHAoL8y6mAJ+5sUcuT9v/l96qOKUpV1Hze
	FMeRKjf6AJY4fYtWiJE7QeWY/pU65neFPqNGFFn7RGfLgNhOVCO9xppVm+34vtKariyWm9M23z8
	5JTQbn6hCDEvn1vG6fO8eDq7VR4O2W/OtRZqd2bNSEVm/BkHddIxhZo4zyeQFmVPX
X-Gm-Gg: AZFdTZefZMjlK5W8iZ5V8HbmLYyXOuTWBSwHpv2gulBr2jbVressWzNjQz4LaOvQXLh
	XM8FREsnhztTzGsEe1ncrACn8MWqEk4pDcDIkz5rmWoP7O48h0k/7yZ0iryNowS1O3oWJKGnZcx
	0J6TsrOBN5ietGaU91798QDhWWPgdw/pE1wm0g7KIQXgB7isb3mK4t+h3ShWk72xGKh4YlIWGiX
	29lpjNO4RuVCXVhDsiR7HrmU7jFGHpu2tT5Bp2IraLCw1fdACTvORlE9bJbv7B59YWZgcRFuVCY
	EMflnoRF9ud3Oc/RLyibugY102xQjBdMqeUWN8p03tTAbbTZc9d0sYHLxf6C2NhKWBwBvF0xkv+
	xWSoLDxJ3BQabJnYt2sF3HAY1hJVVqLVWDTekODr9WZEBfK4n2R39mGp5Iw==
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr9602080eec.11.1795565214613;
        Tue, 24 Nov 2026 16:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr9602057eec.11.1795565213947;
        Tue, 24 Nov 2026 16:06:53 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:06:53 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 05:36:41 +0530
Subject: [PATCH 1/4] dt-bindings: misc: qcom,fastrpc: add hpass label
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
Message-Id: <20261125-fastrpc-hpass-support-v1-1-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b06269f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EyBXVfs1xlidXAZbQhwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX4rpjLfFYYHk7
 rv3kZGIgC/QVp0LluF89u3aa4CaHIA2llXaidRKDfFMugqu+ZVrtdPpsOmKecOE7hTC5BFdPMTL
 hrZ77Ly26aPaQACqoFYLXpLwsNIDmqjWYkPn/2jKESxI29LYgsTg+kJIgM2hCWaeWgZg7Yh44Mq
 WBVD07bXZiDQ7S1yLxlHKmYKFDX3ZR1ZEMBOItgwHeWKVu7jCry2yBo4cI2Sevl7D4JZSuYCV2X
 j6VsfShZNEPO2Oy2XTPfOv07TD5AJxh0DOXkOy3a4QimclsBrY626gaxyyJHl4giPeaO/+IYhyU
 nirfaL9UPFpVIlbEqCJaewo0NO8VWxo3RnAMawBo3zvjYCDKrbTbORycDskK+1mYATWVrRgz2Ak
 dgzsCgrXhnYstKEDPHzjBp59U3dgYvGfvl/cdJ3SrDT5LgEH+OVbvLQe+gzSxnIMdk8FvqWT0Na
 qIRjaSdtBkxHdcwjG1Q==
X-Proofpoint-GUID: ldDdzjkBRHQihX092ZGtAUQjYFjDmlyP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX+wgFtVgRFsiL
 oPSQbAhquGKenTM2oCg50smQmx35+O7qrew5MPFQerrl/DaK7iDGyrc31tyU0wuPRmijRtwtscE
 2S2OniooDLnrFvFmlwK3zfiYzpQLqYs=
X-Proofpoint-ORIG-GUID: ldDdzjkBRHQihX092ZGtAUQjYFjDmlyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250000

Add "hpass" as a valid value for the fastrpc node "label" property so
that a fastrpc instance can be attached to the HPASS (High-Performance
Audio SubSystem) remote processor domain.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 6b6ad95d5cf4..a7f7504897a5 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -41,6 +41,7 @@ properties:
       - cdsp3
       - gdsp0
       - gdsp1
+      - hpass
 
   memory-region:
     maxItems: 1

-- 
2.34.1

