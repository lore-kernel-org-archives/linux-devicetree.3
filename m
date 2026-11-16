Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830792;
	b=qNna68OtvM77LKepoUWoQJ3tWrXacXUY20wmUWJQbNHUBFtbZfwPyHbX4PFDzUousMBy
	 QXaaECWwyPGZ66XKz1rSgTPCGsC7Ffz4Uqr7+1HOvmwBvHUCF45rmvrbs+qDIbgfff8qC
	 Q4j8Q+XKIVWOOsoaowUfJxEMiC4pI1KBl8El9hNhl8eAuYhCwmEvpB/OaVKUmyAMwxmsQ
	 +sxVwHr7veiK0sexB11sN0m3gwhIKySz0k2+yKyF6W4QRigY66RO5AEJ+/Tv8L7KvP6za
	 tSGbOGR0EwmPQMzseW5iAFGMFxWbKbP5502RhLCOwc8gcsi7xbXCXduj/ECw2HNtqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
	b=ZdDbkvGrdO3eKqEMI1FSZ5Y0X4jOYFFmqNqvKgDWWlIPw8B9KqK/M6vPs0/1KkuwSNfI
	 tnKNNbKAeLMPS26E5mUpY3G9VSOylNeojsAv8EEweFGrhrBUJ46/WA9mpUG2j3s1F15wp
	 BM4K7ydrY0F1nk2CRWgTru9D3StKoOa14FlhrqmRYYw234prKxw7gubD17U8Gb4aTwVr8
	 D8ZEYk9cyfuPx2F6uTB8l4oAWI5DcA6IQ2NiJf17GH3VcVlDVGcvddL0TWBwz88yOz3Tv
	 Nw5RMVeNEhNxXKydidCowaA3LfGykDUZTmmwvnVvANRRyOPUSJm9mcmrWWaH8Me70UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EB606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78EB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0rfs1482677
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/
	fVemLVYk=; b=l1waFYlHSGTWaKV8pcYoX0CPS4mxcsvQDIyPi0/+nQ7GJvpnP+N
	zGCTak4f3ddhLpjs4WqEyKaBKOUtICqvCfLxXS8HOjZT1jbaf6JqW+rvREK7VQ0D
	QHQlnJLRqKD5QeOWcV/JCUcEb066vi3nTOkZGZ8OBfSYgb4iNe/UjGaK4aFQdivu
	5UadOVYUdotcYxEVh97UOQJt3W0TNg6niWrsbW6vu/CRlf+ePT6e/Vsr7rN1+/fQ
	0auICp+vEWwosnVQG+1KVGPicMH4O/s0Q3eHFVRvZBJpaJ0j4i493R9ACD0/KQPl
	IcHTbwugVc4pXcBjPUHHpGFVvaqvGJFSNGw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgdsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1318372c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830790; x=1795435590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=etq4j8gJm602Kb52XsWBCeLsdnPzn0XQsBJn6ioMSxlsQk+wIV7C/i+i69uWjbqulD
         /mDs+971ar3IdbXJuWBvMNQiv5kU8DdL3KqZY353eOxKWDfUWyGn4XW+NLDzWLNxunnV
         7QdG7GS+7S5HOh1bs3+SoHawKU6ZobWP6tE4CLeWXdvgFhHRV6cC5jEv1zXfjoCdYQMw
         RqzO/yysHJi5dauHVJtF2ImBAIwkN+pbCp0t41FzOkNGoAS4bvK4iOHV/WABSvDxyBvy
         Azvd4dyRaz9E7euEOg+jbl+fEXHDBBD6jA6zySXk8OcsMTUiPu/u+I6v2eBbiGrJF72B
         +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830790; x=1795435590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=Lrn3W76pschU+3MsXxcCTHt/n3eLlXMDToKGp141gSqvUAs11dHqXYliFqVbhFI79P
         Q77bnFt5kQgI60Xr55v6CS2junCgMYLZC23ajRnvWGrMW8YT1qjd8rI3+Ds49pL/7tK9
         JKJdUQJiouoXIdZC8LdDrkDo6/2DjaNYxXE6uP2IONUxD5M0qFIW8jHgBK39VZy8OBO4
         h4imRtH7X9VvDZgFNdrafacMmMSgLCZZRdxnp7ESDc+tRkTBptOH5K0UfoVMlrdwl7xw
         RGtrZ0KdSM9UEYEZTYtD+6OvW8CO7rtefI8ZMeVXBw0eCa/uw4790eb0eA1r2VMtfBiu
         mx1A==
X-Forwarded-Encrypted: i=1; AL+hErGjj45VphR9VpWyd+p+DABDvxL9c4uKmhFj+eCj1poA05aa2bjjkY81qvGLSv7/OdW2ivuZ4+aRntXz@vger.kernel.org
X-Gm-Message-State: APuU4Z8FieVmKckzGkosw6D+QjbKnOL00iElQU3tFQQWbPzsnhm/XkXF
	Y+IX77b/n+mary8KhR/x4/MSUzAgJ/a7wp3ZhMF1CtE2ncf7pCl9iyeKJsrnhQPxeLBkH1KQqDK
	TVCdxuyS8JgmU1412kZOQ0ollHESKtRy47YXRVRM8aepOBJnhQ3OBLTFdNj1zTnP+
X-Gm-Gg: AYBFou2T3KPBbWsu9bDSs3/PLboiJPi27UOnPl+0ILth0pLLnfQ5y5uuAajNeUtoEiv
	A3bzM7Wt2FGGy4h6xjwaGK55OINGDfQrMNuJ4A9306Sv98TQ/zTdImYnck2LD9q6BhkVwybMPjv
	SFXT9dT6w4NBF2Uv/UJ1h0zWxvmXwn9bA+sqIHquJiexSWsuDUE+mnmBluFhxtU7we4JA3dKNl/
	Wis046yEJNbO/pqYXpIMY1WxGBk6zZyjEAGSZPZWTzehh7UPxun8J4cEY4VkwNX+0o52qSsiTqy
	URyxut3FII9fhjdcms931o8wAqaIiySy/LYO1btBX4+f5PgXlZSJetZXTwMzrg6gg3ZnINyMFJ9
	56Ye9CMLKO2gzXVujGxvnR1JR0X7A93fBEVHyzxvQFqQ4EZvKynJdXBtpMsK4diH9chmsbHaqiu
	Agag==
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975410c88.28.1794830790316;
        Mon, 16 Nov 2026 04:06:30 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975389c88.28.1794830789589;
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:36:21 +0530
Message-ID: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaf1c7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 0r0tUvYFGoUFYsjJO2cT2H8u9coESJqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX1sLjWGMchOSF
 bU5IoskX5w9rnQ1tuz/imW4hU+rgoyzM8c/Mjuvb/CEWX++8A8J7+RVdVRNgUIgsFTK/iAHmH1L
 l9iuAUIpbxqWVAk7mPtNzLjuVVuxTQjcb/jtK6W8qQDlBJS+ARg7gNIQ8zMHcrqL5epbvgQGzp6
 UGn7bFBkhMQ4F6q1t8HNSDEiukdHf3FRvnUC/LUaOCPkOkFDVxXfgyZxQ3OMBJWQqkh3KZcpkXN
 yJvP3BsgD+W2y41wbD7o0fhyfMvKjnGwI4Z4kryMLvfH72mZTcbQY0yjtzuLGr0kszUuFhgxf9P
 FRKT6+t9N8aHcUfzMXT7b4KWVMByjtY2NR3hZtUhRUCtOGsQw4H72WC45DG+9wMDRpxMZQNC9N2
 mZ14cvgF7MHQK7oHmYroDVmMuzEOOSBNCxGskuwShVZrB/zAD74IPX3kDzgZuHps5RLNAUbXEXR
 CMdmVb6l/BAyf60jFLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXzjsRqbTJJwD/
 e890SqxNIsQoxJcgIiHbcnOgdWWwWxk+T5M56QvZ/bSLfmHhAd3xOyTRRh8T1+Up+1Z1SY0yThX
 thY8QLSaXThelUzU3pkShQ+VDreLcRc=
X-Proofpoint-GUID: 0r0tUvYFGoUFYsjJO2cT2H8u9coESJqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. v2 [2] split the change in two
and addressed review from Dmitry Baryshkov, but went out without a
"v2" tag on the patch subjects (only the cover letter carried it),
which caused confusion with v1. This v3 resends the same two patches,
correctly tagged, with no code changes from v2:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)

-- 
2.43.0

