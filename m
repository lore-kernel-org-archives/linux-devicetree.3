Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3143E63A1
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837083; cv=none; b=KxdJI2oI+Lky3K3axt/grSLg/dYK/3LxSkQ+Ykb1vrV90NeUakLrKWHKEdbz52GogSDPrrTTFvVlHLNbuEpte0AkTCwlLuOP+ErhmwkQmazIfnGGstlRxdFDyDbk9k/lCO+rM7jSeXi+W2rZ+6UE9CJUWJT6poQ+GXlwDysAh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837083; c=relaxed/simple;
	bh=QuBewEBT+HmHQnFo2832RUFL+S4uDT+H5Ey06DivlXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U7jgCwihPusxTAO9+w8U7VmNFdpakO9J1vjrzWuWfCWpbxtPWAgMf+M/kT2yYpaBFv+srVqsIiWklvPNsiIRR2DervDMKevFqnz2CIR090Wods/qzqIEMPb6uzTyxFJ/OerM5oTNajM6UmdaKzrDOF8xdcYi/kLHp/szExS8ngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCBYwC+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+NiqQEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCBYwC+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+NiqQEG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5EiWR3795697
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8r0+urtJr+9UFTEOHTjm7X
	R37blGPy2oYcB3ySkXoKg=; b=XCBYwC+RwEfqbDNdRpCX8poJ0v6YJl8ZnqKodq
	mFxGtSYz9Vmoshic4nWMjpUEFDEL4SLqaw27WzD+suqy6EaFdP8Xp3tcpzoeiKLT
	hn9Qg/+ILjhfD6L/OhOgt2DIo2IP6hZVdnD5Iz05KC3u1+vqySSuDO+BjSJOln/1
	GGZkh6Hf/QSKxFzvzIdLndp2AoVJZVpvVU33YXJFVzOgh0XwPVjbxPtDh80A4rss
	/nghUOwp9An/iaTa9a579gGXCVLwJyfItOgZniucoIJ7Z1NGcewx/LezeUtQ1TqH
	oebdKJc8II8WBbpVYjlFQpno47LcqCF0SVtySW4xnZcky/0g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stjtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:24:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c827adbf00cso3373709a12.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837080; x=1779441880; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8r0+urtJr+9UFTEOHTjm7XR37blGPy2oYcB3ySkXoKg=;
        b=j+NiqQEGUasNVFsLdapPv/yA9cLwh8y8x75ngRVRqwAeuXUH0lCYq2TmBGgw+I5gSb
         Ttfv7XI/6+GF1vZrqQNvmL8ZI0uyJHdV6IOLg53ARxLWIVcbzALf6x0Mg4ILsk0m+FAc
         4kw0k9nzRZIV0OvDxZTXbeVtqr2V2N/L4F7rFygv++T4dyPAkeDUwSLq8o/jdKB6+eoi
         jE1hSqUmVQT886cryoas99vheUcP0VBi6nXOJaZt0e89l6OmrfVvorKE/l7ATX7cTUlw
         2Y30GRYklPX/hpkvm6BD0ryvWY1FLKoCZ3+fMbmVkN8UwFhs0ZnK8szE8BZ7dGo2dKP0
         1/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837080; x=1779441880;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r0+urtJr+9UFTEOHTjm7XR37blGPy2oYcB3ySkXoKg=;
        b=oAXeV5FBu6BT3ikDFRreT12vNhhl6E/URutgAvz6JjTCPgJlgn8qt+CjErHwvFfa4A
         4BB1nxePMD6kSzxaGzN9VD8jFqrLDO7IsAWkNvUa2GEHZt7nu9ej+A+eMokzN/s0cNjG
         aQK0M54SveBCQNuyePaQsLrcoK7r1F3CaDHcZzaA29GUi4FtEE0nAmiQuFywVdhlnLHy
         SqFjpotu7NvI5fbQvnUe2wV03oWdjs9gJVCu8nGuoauPkSemCAlFrYqXn1NuX4mXtOi3
         c4scU3FdC8U9E6QwhOc8mK832JtB7IwT60EEi4bvu+cdHcO18IPhNIDzIUggjgrEM8TX
         ps9w==
X-Forwarded-Encrypted: i=1; AFNElJ8hxUfET+8HgMQXuVqxSkOYjb5lFyZo4K5jpoBJLyKKJ+Wa4tsbqe9bNFVHvy3YVrl2XjY16UIGF4u9@vger.kernel.org
X-Gm-Message-State: AOJu0YwFg+TEzOj72dMuA/nUAmHI//z4SWVg5KKg/NzGVVfTo3ZMPlJW
	0Cdxcex2XEwo2UiFP44tUOoUj6LfmAh2LKdmr7CCoapgkFX//xF53MftEY4wYBLgaiKhP6boYHY
	5bB+YTcjCPs3habov9JyWdhFgyJP577X+Yb699WBo7rJt0h5vhA9oh31d6ZBVi1ey
X-Gm-Gg: Acq92OEs56y3oP0l6ZKLHH6NDnQBg/hs2Dgd/aJL2f/2xK7w1xDo4iiKHKX9dlnZhbx
	Qjm/z7/JfSW5HE7ghZ5bt3YkuImAFV7+RQDcQjMVittyYpPVa1bv9FqIHg2otEvFMwcrWNLqjGO
	rrPQWQANjbqqvNSRVjW1BRsb/6mPR+Xo5/ixI4iwvNKEftw3hQMvkLFHj3TuOvnj0GrrM4NgELl
	0OKeaRCzwz24lj8GCxBkQg7sGYcmKGboGZ1s+tAEKj5dfhlls/65MvwjWN+g9KtGOJXXjyILXs8
	02X+t+RvE1otPurw1eX/D/TFmdDWtNcaykRs7jdLfPY+mfLcGN2KTclynCkQYfaC0ckTFQJmvW4
	cnOKCb39dNsmKT2933k2oAQoJWEflWeA4bCLnBKgubOo7mYEFgIYhLfmTifUfWV67AGgTHeP5KU
	qRMcCK7D6SKpiBthfYKZQTe+Ex/OicOx+45dFdQGhc/i+e6GG9JP4=
X-Received: by 2002:a05:6a20:2594:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3b22eeded7dmr3678981637.47.1778837080538;
        Fri, 15 May 2026 02:24:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:2594:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3b22eeded7dmr3678939637.47.1778837080039;
        Fri, 15 May 2026 02:24:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm5308697b3a.45.2026.05.15.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:24:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:54:34 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFHmBmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZLi1LxiXQsDo9TUNPNEo+Q0MyWg2oKi1LTMCrA50bG1tQBqzxB
 cVwAAAA==
X-Change-ID: 20260515-tsens-802eef7a2cf6
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NCBTYWx0ZWRfX7WY0NoygTZyr
 LzZgraeGl/mBWnchbuHWALaLsdf9YDCExAstK4om1kYER8+gKi84agMMMNeKZl/R4NkCAiWfJ9Y
 J+tgZNrncgO0i+5bt/DuufZpgHlCRBYFtJxZ5HQOSQlyZfZHrZGGSe4qSS142HP9m9/iT9zM6j6
 ElINjyDKSedMwbdJj2pkBcSxGQHfY4rUNq9za8aKcmUxFxUSCUM+/MqM0j5FBtq0vwdhWhLgnlM
 HkcBvZGs3KbmvM2O1BKdBnCuY9n0Ecr4Neg+07lXXJy5fje1oOm8U3oVbAqpCEpeckzMmQ2C67E
 TiEY4F1tO9zma3f8xB74qudE1jBfxCfTExvxH1jSYAd+vmGEzghgUEQqu2NkUZ2nIHd5TitL5i7
 LmkDQVg4F4OaIKwlPqG9uGqRGVocagdSo7ulacWcbfsgh586ZLuTJSYe1bOCOP/JzlNsF5ud17p
 oCFcqZGReyiz4prhdyw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06e659 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=E3ZHFlwXONBU5DQtPr0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: m8hVYXoCEtVZFSOscs0O8qYZbe557vgR
X-Proofpoint-ORIG-GUID: m8hVYXoCEtVZFSOscs0O8qYZbe557vgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150094

Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..eb49ba609083 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -20,12 +20,14 @@ properties:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
           - qcom,ipq5018-qfprom
+          - qcom,ipq5210-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,ipq9650-qfprom
           - qcom,kaanapali-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-tsens-802eef7a2cf6

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

