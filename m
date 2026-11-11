Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419131;
	b=akMjlYuCpCyYVwAat12C9rtmHFHNKwzCzr5E03bX0nXKIpivaRY5Rm7oXXJOuHobfeq9
	 /VDI06fBmQqXcPVWBf1j4uEjRKkT1rPQTFrAZSC5AvXI3II0iXDghfGtJTKXWsAV+65Im
	 M8fb14ohrJQr85QdIUdqKHmBbJQcHXiNRpKvnwwZU0wH1A9mvPkxtmuRj6SvyhvkZZdO9
	 b0z8Vi+xubLDXsyitgCaSMfXrTuF7s0jq0Z0TW7fF794w3Puyw6ooNNxiGHldo+sJUpEq
	 ga3VuLwmLJVOZDldMeOStVwoZApcmNE3/NK+Ya8qZ8a4czhZwNHYfpox+4QnNKAjO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
	b=46Dn8OyrEAuFv+btEDg97AI6kZtkQH1HkUW744rVMxUwCvAFqWicbNhsnE+kLBXoPQaV
	 n/aGj1brkuVDtkfw1k++sG3xQgNGSqSnONMlR++6jjakt7E0PPpD6U1CJRC9wSEgj4EWN
	 vUMct5mC2VfXnzUJtcjSiJPO1RbU2eGe+RE4dIweCSWkP6TXY+ty+DcRnlDkuXrew5C/y
	 aFXfTe8WmXh+dnX6mEN6OqB9w4ZgfzkCOOk3xyrpITLeSRqmg12LYNCg+8cOOA8dSPRn9
	 LM/993RuWCZbvNP7QGf6PG8hQXyecN/cytCFqlEolx1wblxhqfsOxoonWkrCs/rmy7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDoJJP0e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hAUhLIsy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68112606C1E7
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68112606C1E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDoJJP0e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hAUhLIsy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHZ1jZ2662900
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=; b=GDoJJP0eAE0qI/vF
	ZHtowE6+wn4rJ7X1HVwctF7CzVU4i5XLBCPqRX+DV4wlQklQi71jtv1R8cHkB0nQ
	quN5RMOujMVh+inBUW7JEkd24V8j+Dq1vR2jsM7ADvFPBeZPfLhWDZQ4PbIGzGxF
	xxkLIk8MFOOEXAtnnhhngoxLrJ3R9HRlSrkrkADoRIPyHj4LjHLwyjLeGyiBc6xp
	RImN9lia5D7QSD5ZIPnG4hFQXMTSCC/mTjebjX2CPICpkAi5fZOWUSp9YozFKs+7
	30tAWNODkQcXQLkQwbVp47+rn5k0oDDMZVmuM9Zct8akvtiNxFAOcGBvXUfe4Afw
	n2zQ5A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0g1eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso569313241.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419129; x=1795023929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
        b=hAUhLIsy0Pq73OSCDqu4cFhudemOGrNuB3WKtiOKlMCERyhoJyMibCnVZIBuLdhzff
         5vnTyFJC5yPqln/z+t5uOWHFNOF7KS9GWn4pXeEEJWnJRReDGzxs9RLwOPVyr+dZ55el
         brkkdFxjhArWA/0x7H3+rfwXcY7AhpzPRVLvx3hLc4FC1HuRUdetjkwJxwAnqLY3Gl/z
         GgDE7vj0lHS/a0oS67cKh+BbsRJlUKVCKLP8T3XgXLVINJD1EgjGpeQ3pvT+LmkRRMCG
         /OL4er6+G6+wwaNS9N9dI0E4UpHSZMW07scoQdbndv0Jy8/3qVBAUNdGrb2PsVTZUPGT
         +HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419129; x=1795023929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiGZhumYbA0ESq0UKCRfVupcOcN3aW79xvv0cwHCR8=;
        b=yGiIwTyca3vp08V+0xIFoCUBKs+TGmZGh2HrH8v5zHPRDYwX0EOh1NdcM7ip83TSKm
         GjClrxBazfIG3wW3bnrOjkjRgVo0hRhlBBmdndAf1z3vMz7orSQDs3n6wdnk5xRhmrW0
         KI3p+8sxmrlXr8whLaZ1KlkvHsaHxkhal5ZkKc0LKEKNOyuk2WI4FiF7/dPBK4DrkFyX
         fL+T4i2osEvnwzCfzkMdxXk8WgF3WzQZmY7Q3ZTMx1Tc0jXcL1JdNng5M7ISNEKN9IJM
         umyJ/vyzvZdXMhQkVwMvqE7UgjA3OH63cHhd2ZfIMxiZduPwJgHaQkTuuDoQvHCqy9v0
         bcXQ==
X-Forwarded-Encrypted: i=1; AL+hErH9A63n0ea/yVIXJgfsWOaJB8OrjZh4OMUVBYduGk8YjLB7ZdXIOJQTbvMjq7YjjNQBsQ9WDrysrklQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8JCvPs8A/VGlNzNCIEXO7Fv1ktdhbgRsDWLCa6ykju7epVF5WJ
	e5rd5PJPSS72hguDJurk5ENa7iomzptjIa4cn/XndHR5nvsrmVE6Do+G1l58krGHQrg0W01Tx+k
	WOZBCKuKx3HSHcXhgw9IkrE7seIaZiMWl/DvGbZub/eqjyOcKXW0Q7bU5NgnSvgYS
X-Gm-Gg: AYBFou1ngfFNC0e1ETNxunk65GvVvGTYaCEZiwWyypmbQWDJUZkRnm7aKOUC57flkt1
	t0QKGSAB5LztNCIzZ2CEcap2DWl08qM1xNCh3VHADFIaFIBTVHl2x2Z7BLeuPU1vs62pLPGBUEY
	gRwyPN4CUvPgHprxKSHgEuUV8HX7JOItTWEaevsaH9rUiC+PeFcBLKvFz0I7eX96rF1xrRC3nbt
	71tmuLi/KoV1z3DUYXGvv3N3Hv0fUFvUm6UDvrrFT6yuYMS0ih+NkJlDJCQ7I/uys/DBt8NuIhU
	VPcO/liCutDEVKXrYscMzipEcnYYP74oA3cmUoHGbIlN9zhFO6BSvzBkRB5+I/i8u6DYoDxBkxo
	7IHCw5qvxxVWag7X7E7hnOPCSyrrDpTHvG8ZCfkkaUxUl1aIaAUwivmo=
X-Received: by 2002:a05:6102:370d:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d4fb168b20mr1157554137.5.1794419127990;
        Wed, 11 Nov 2026 09:45:27 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d4fb168b20mr1157534137.5.1794419127325;
        Wed, 11 Nov 2026 09:45:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:02 +0100
Subject: [PATCH v2 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
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
Message-Id: <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21015;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L3KdguA9EB/L3Ka74yLQYceKLesVgN0wddzf9NKIWoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmmxXJDxUDnxvQ/QM5vv19ACO7cQvXHdjcrv
 O7GKozlYn2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppgAKCRDBN2bmhouD
 11KMEACV+f+8YCBTHl5IxMqyhainpZoqN+iAyCkwQztut82vVve3dT/t/LSaEDEcpgJ4YoSyQJ6
 Uv7LMtB7HiMO4bBS/l1eStJB0ao0eY7ngvbETDvi1jEzuaI8PUzrPytdZPaNx5roQ5yyrUPU4xt
 2+d5mK2HlTpS6k+Q0QFuJWMpcSjqaLkQp5YnJYwXURjnSiki7doFkWEC74mC4rwVIipkqq8ZXUX
 y1AdNuo1YdpOU6gz8hXb6HiyMgFlJXwvRw8Xlm88ixptMxJQR2ju7VEVhy6o5z4O/Z3VF9zZpK7
 w4TOThyRojePZGaBc95QXxxVxkQPO7iieYu7kUiRZw2EevM2v0h6ycio1hAv5KWpjPlehllRY2x
 pEC9v3dCGf4JXCVSBUdOhj1BcXmAMNSleT7A51l+p2wSayQ9VsLqJwjwa+soH1NVRo063ESegQm
 yYutmSq5C+wmWfKkdXQGHYvdiYAnh+BXmkd4+wVxSgN0ACS1hvlbCNSwhzF2pIpz9FjgJomFBCW
 R3wK94yQFOpcgJhTaS4kCVwPSD0Rzq1EaZUQbrNmpA6V3mYQyEgPtf//19l9lfPIT/xGlcmcNXn
 ytlutxXtcmlVN922Nw93+kwOVYsU/LHoMptb3IIbUPL6G2Fvs4CzGsIdT+7VJyuH+YoFMuj0cT9
 lOP1uYjbLJbCMYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: GEI47xyDyAdE_TcKzfqO973uhNVWLfuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX8ufXlW8HJUOf
 XPkzPOiOKBK9aRpqUSL5Eol08e/bQPkG+IrlG6ID+5KdKoGwf+C5qSnb0Xs+w27SCXaNDn5xa4k
 dchwnadYAQO/42elP1VgBkiNh66EAO6ThrqJVWNyatmKhgcg8nRKCRawGvt0JMEcqsDLkNy+jDA
 yUME6R1I4esD1yLe1imRix8n3qQn18kV+4PnB68v9SQ39IYYlzEAhLU70Ea4K6Nqoa9oBbZ1Dre
 9hN9mLwTTVmIJZvIGKyL7eTFAy7A5W7uNO0CYbwF3jt0R4gjf4g6pFFEPZGk6YpYAuJwPaqoQQV
 kFsHz9IZp8UXYvTEwRRoaMvnA29804Pmf3hCcSWEZ/QHe2TrFwMOr+yhodw5hkK27d3BYgbaYn5
 V+rPDRbo0YnZRDbt/gsaiHfUWEoJgCw496l/n+6Ru/jnAsv4Bdq8B4o1IX00yHSierpYjLPLgMV
 b4hXV/koDALbS3F+8oQ==
X-Proofpoint-ORIG-GUID: GEI47xyDyAdE_TcKzfqO973uhNVWLfuM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX4gFZ+lH71lvo
 H8WlgNzxDDsUIVxzm35zjeZZEWkXcUg7iFIZqYH4f90bmnXMSAEU8wczMB1OUY4CgDonJUhx13M
 i7ZX9mM1xQel2ML7aZ0KxhuB2PE7bQk=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af4a9b9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cjt56oMJJs6jdj95yyUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110070

Technically, DSI controllers do not need OF graphs with endpoint to the
panel and could rely directly on their child node (when panel is the
child of DSI).

However Linux Qualcomm MSM DRM DSI driver never implemented such
approach and it requires a valid graph endpoint pointing to the panel.
If it is missing, the drivers will silently accept such DTS in
dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
of lanes is not initialized.  The number of lanes is initialized to safe
default only when there is a valid endpoint which is missing data-lanes.

Extend the bindings to validate existing DTS to match expected ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Please apply after Qualcomm Soc takes DTS changes to next.
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 25 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..e9446a333fa1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -201,6 +201,12 @@ properties:
                   - timer3
                   - timer4
 
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
     required:
       - port@0
       - port@1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
index 7010ffa0ae35..8b9f54f189e8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -241,6 +241,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 2d9edab5a30d..dafe5c5d4b75 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -181,6 +181,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -251,6 +252,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 49a7b5c4c678..60ba466382b8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index 287cce4dbddc..c00c4d5dd918 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -235,7 +235,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index b68e7efbc189..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -258,7 +258,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
@@ -335,7 +337,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi1_out: endpoint { };
+                    mdss0_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index fb3d24bbac7d..3e4a25a217cc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -326,6 +326,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -418,6 +419,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..16ebd5d701d0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -206,6 +206,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index b643d3adf669..9f84ba248a83 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -230,6 +230,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
index 00e82bdbbcc7..7e653552fdfe 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
@@ -242,6 +242,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -333,6 +334,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
index 7dc269322b8e..4430baecfd99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
@@ -196,6 +196,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -266,6 +267,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 6e8b69e5ec62..1330a5f80e3b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -192,6 +192,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -262,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 309de1953c88..2993fc1eafe6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -179,6 +179,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 3deb9dc81c9c..a942a479a440 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 46e9335f849f..62920c8fba0c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -221,6 +221,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index bba666bdffe5..faafc451633c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -201,6 +201,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
index e22b4c433fd0..46a8539308c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -193,6 +193,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 9b0621d88d50..5ae181bc4fbf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -263,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -355,6 +356,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index e6dc5494baee..7edf4ee9e52d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -231,6 +231,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -321,6 +322,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 51368cda7b2f..bce5ab069324 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -234,6 +234,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -324,6 +325,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index f5acf528d0e4..b9087a06198c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -236,6 +236,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 747a2e9665f4..800144f1c7e2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -243,6 +243,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -338,6 +339,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 59192c59ddb9..977c2fb1595c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -239,6 +239,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -328,6 +329,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 0f7f79527748..05cc2f9753ce 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -227,6 +227,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -316,6 +317,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 46dc0d28da29..0a8010f4d9d5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -364,6 +364,7 @@ examples:
                         reg = <1>;
 
                         mdss_dsi1_out: endpoint {
+                            remote-endpoint = <&panel1_in>;
                         };
                     };
                 };

-- 
2.53.0

