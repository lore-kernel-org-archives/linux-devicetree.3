Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467346;
	b=jir2pQn85ctSKqOkSg2OHLcE1rzgoI9Wdh1Y+Mh80pRpdtV4Mp7IxjDyuYkYD6rulxQI
	 NY5S44SCFH2wNhClhj/QmTyXoUW89n8vdH3Zcg4aLfNQJf3zLRu/7i6oNRM3KI96D+I1d
	 KKJTYqtIg9DJVC4ML8VuvS6DMcC9GZQcu0CDVhmOOsJkZ7CoPQhyjaWi5d0dbSh2rOpOy
	 B2PDW7pmudeLYZM6LyRyAWabzjCWXcrK1iC5CIjytORAskNILxhHqmTqIW20Iid3wGHPG
	 DTxx9qvWdrVjkYQ9htCs20ZoPW1phse7mCowtVWSMvJgOihBdTDsry7XhXmzWRTTv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
	b=cXckxSl0tE/jjhV4DbTBi9qCLSd69lBburIXPMbSJF+5QQH60PRYHBJaDc0LphXiCfdB
	 BiHJWdWIgWKly+4ED1xFro1NXGKl5zoLN5lVBcGVmGvBinJ9fopasYYV96YyGnBpM8Pp3
	 6XPiOdtYZf0zKqIlogjYXidBp9IOLuQRwerhoMIm/BWmRj04grrY3vGDQ6KLNioDa8bre
	 NGkyWGLZEW9TOm5UokAkVrAL9OyPxYKhFUpFASkGLfBUHWlXGdu2dwpwEDE9Xqyd9g2Gp
	 aL5x4yVRfkueQw9C7/7iLzp55bme7KdLE16SUVt4OkTfnGbACeH1VBVbpzwwLgp/Q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD755606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD755606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuufC026550
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=; b=TfhYu3p4HLmEAiBW
	Ys7hkLgYGRWjH2zZ2JTzF/Hy+/oTcf0+qFKPXf+uRkCIdFMimev2n4D8JQvok3J6
	Kh6ZNpFq8m26tpUe/caZfgwnDGhD0vzsoH6Mk6oHJVNfV/6Si9txQhQ0veRvGgzS
	omeA+pcT6ia9XcwcDo81OK+CBnVPr0QXKy+eMtoJIi9bLdTXuienzgQkTjwsomFx
	cpuCZTDG36vYNs+xyjemhHRDbT8E7DrFh+SaOGC7Ei6HpULF8ykRc/3TqA9AQjgZ
	G8Pbu4uTDRZTdZC4pgMKclogz9Y9mkcLm0QOeOrOBoaqz/6JXisJ662s0C+hyK87
	toh/1A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3fde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so2355269eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467344; x=1796072144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=UHZhb3Vq2Giew2FK0Aqmns/RaGLj05VTLHFhNJJQagLICQPuIZMYg+FGZmijYMVgZf
         8xEaEta6924Lh18aY9gBYChrLLAA6LKTSi/ipdYWP1nZNsfbJ1Yei0dmK1MvqoHU+NZW
         X2AkXx3B10nem4zaEzcRYP7ZrbWECn5oQgw1hf3YUXQiRsOFTKnQb9oB+lEzHsFUiZgx
         sEiR0ByL9YCbipF4uTQ1Pv5PEUWv9DtCTkZr2OobNFfrGZsWmSGU7K0MQ3D9CiGhZwS8
         n69nH/ERdpRFG2IJr/A/SXnCNqd+unAFaH8vzdSCadCJVPPK/Uu6nUg+VeF/qUSVzFzH
         DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467344; x=1796072144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=NbXIaSKyLTHcEDa8Dq6/6yMb4qI2GcMgerFa7abOVl7vW8Xlo2l5Elg5EYUkART/bF
         fox0DxVSfAlF91dcFq3Ui5GjHYmPDmajhTcwPoyt3FywRn5UqN8vvgCkw4motNKjGINI
         MNPFlQ1zGCqOBeXSUD7a8fxtoNcJyk70y6jzztJEHtvGUgrjZIzIzA1mYyv2oN6hrrSv
         UKTrn0ESDUvJJaXE8s91mJOEr7dqNFO24bB5yrZn02bkGcLfkAfDw8LM4+JAp1nisZaJ
         Lv8LKGhchM80EesXDOWBbzGZ2MgfGLdYwLVdhU5eLMuQEASEDUYghjpSRzPratOJS+ns
         vVlA==
X-Forwarded-Encrypted: i=1; AL+hErEEj3Ns4uHgACZkLp/IDdNioc/0sew3DooVG+1GCJxFNJB0u7iv511HmAW8jDCcDI7kDFqiO8iLlC/h@vger.kernel.org
X-Gm-Message-State: APuU4Z/3VCY4CG81alg5y977u+B+1Yf+liddNyxSpAk0hC/+xwlf8EgF
	pJWihTYyFe+iGaSDMDcIuP+PBPFw9KHxptJEjklwyWHlh6GkWNaF/bBypGJxyvyMitN+mfnXnsw
	+1lXnwXBnu6wSe7rmOVFegBycbSXw9yyOrDA1oa8pdxSMgz6+McLd642pW9+nQpLY
X-Gm-Gg: AZFdTZdDDXjLEwlHMAwTtBUHOu6pnP6sK/VI8vbZWeKV6ZTWHpH5Sa6+E/2GzNQd69d
	3AILPbGzB6L6PxOJVUeaPVWeaGVQwNd+nqOAIxTLXYne2KllFFhvlA/lq3KmegXg5NgMRubbpFG
	ZrjJgEbhINL+Vfo2b/elwyTs5S2QvAh+T6qebGjtYtQFHucJtSKV0ck1RYYEBcFee39LNqfa6jn
	MG+HTfFpqyLSFUXJNrGaIN34QfWOGsyUqge7ivxP51vbAWmRyvMjBkpSY5PxcwykIRH3I92WdpJ
	wL06pok6SDUpqOCdUOxBcAeMquXMIdA6ReGeI4RDZ2alR3yw75VwaiIJH2tFDnHrl+jQRmBP18N
	2+lJsRN8Roz2VcSxolw3hYKSqp6tDvIZFY38LOr2BKaBMdXgTPX/QJwaGi5bD+28k+i7pSmuwrs
	0IUHszw0cx
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202063eec.31.1795467344423;
        Mon, 23 Nov 2026 12:55:44 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202032eec.31.1795467343843;
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:46 +0530
Subject: [PATCH v5 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-6-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1301;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ULRBXyIFz867Nh5qIBr+xcji/05W1S7N0crGceoW2e0=;
 b=XGzMJ068AmLrwGRQFHZFLFtWzDcU2FDiEN2mnxyhJfAeDvIbvp5Ol0ciu4Eu3D4VdRnPuwSnH
 20QpK2bPny5AjjLfjdfTcw0eenprUoAhNjIvJZ2etIKzHw0OSylz7HL
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: WtWVyq3NAslgtspFuBrSXCG6VGQXUvj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0n1zflMr4oT8
 7a0Dp32tEAYTlG7WbxHBDYvHtbwQl1CsKQSuOCUWehcm6+hF09gtALmUUe74fxmUxjVXkATasmN
 A39Am6mvQsIe02BYz2vHPPjHcG0PB6YVkkTJFnjOhYegiwpB87um6VbIIxO7OkzF20A2M4R4gh1
 K5oskXyHndjHLX89gm7f6ti6DvZl3xqTSHt+3Hmeor/wGgv3jZYloWz5c/JlelYFUNo1RreXj58
 3Pv5JaCvfQJv7CPqMtAtwbP6EGK49evtlACa9gZejJ5nh0ysV1h+GQLBYOpQzPjjSHMekp/3VSA
 IKqGwHE5GOO6n694DvMlAGN55DZW8ugnFmfiMyIjfVD0pLsGEFdKxPkwPJ9dPLgnHpQPWNLO/o3
 fU+JkwJ+arXuNNvt0jYq+zf8jz+i4vouXcsLI9dTiqwp7eEFg88UY46B+u4NISvOJsC0d8GSh9m
 zQIBo+OdvHNOQZvhJ+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9HpHfGPAl0cq
 xjxRnGPxNzw/4OOpJPmN6CK6ay+0iqq5G8Z1tZXZErcIwEiDbXz3Sx5WNzobbGrH2wlA3P25NQ6
 mJm+dJjWl4n6M8r04mJoyTtQVP54MSs=
X-Proofpoint-GUID: WtWVyq3NAslgtspFuBrSXCG6VGQXUvj2
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a851 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

