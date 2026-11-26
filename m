Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688496;
	b=hYxqh/cs5vFKtCgBcKx8hqq76THdiMdLDWlTnApvFeFCEgy4edHJQ5aj4WjSU7SEaBZP
	 rqhBswoBnJgYoUCO8xrTfcoLKmuNltt2QFb0qTQo5dYXAHiaHN+xfv+NHUfN773gdeyPH
	 X3LL4h+qk3RBqqDnZLqSew9ZAZEMfHySoaFdJlxSSqXeI692NEi6brdTcPfaCAZaCwtcT
	 blw+o7vywl9aCrBORlynwtLOwdMGjzE8zkaLTdvvRr09x6iFax6xwHjlswuQif7n7McOn
	 QpsmlaAQJyLfaFmakFilgfgc9AuOWCIkFoscfMv6jIsJfL9h5cGJDYvff8fUogXRihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
	b=AvTaAUNns4RmtegsaQcL1+oMOVij5PeH9p43s7kH7LXHXr/E+vwHeZM5v6T341PMe6i3
	 hMzt9IcIYOGwWfKZvGjpyqc7XXHZiM+j2vh1Jt2fB0LyQ8wHQB1ojBq+5TCXe6EcoO81+
	 gUP6nYz9slfgvOkzpD7WfBamOC59dqX2w1iREn0KMzkBfoilsf36x3gBHd1YaWtD1qUoS
	 xuxq2UUB0peGE18TetjPxltbz/FldE9cyaSiWhghL4sg95p6jZM3pJCiI8twUwOsW7Wqk
	 kcJNPPbcCjhMBgurJo1Z5IfLc57rBOcE9dGooou6SjgXVjzg7ipqBY8RFCKZc5dLHIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqbKcuaU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15521606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15521606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqbKcuaU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AtXD2885531
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=; b=hSLg+Y+XgJqDjPUZ
	yRLujwQbzavYYO74euLdbimeyrrtMmaPEge5C2jEogzJfeElbRDYlkfFvTzRRjdA
	O2M3pwzmNrwqKrxt5xRV/COde9S9QlPWwv/k+1ZrEwiaPImxKHUxC5g3ZcEe/yOy
	8OPhh79OQ3TnS5hDpfg1YsBpjfJuWTLZSJYSmDoMQtDAOgUrHd6FzMCjurBa46Fj
	iqaMGVf/KMHOc4IJe9tHCCzjkKDy1zq9+yF0pg/PeQ7DU/J7E2xZWg2gsOaBGhRZ
	C3s9uA9iNJbFzK3TV/iOPLmOCiL/KJhmc5ch6G1e/Jyx/Ku8WYVcwkFs+tLiP8Bp
	cqDjjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgyg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso1255588685a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688494; x=1796293294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=CqbKcuaU9qjpK9HJKQ2eXFJWrsO8gzCnw5iA427aqQpk1rjggLv0PvDnjoYOb9JMdi
         8qriXUvjZ2yD/2AJ990n74r7np+Wr9y5aseJKYSvQOBjAKn/f8d63Hi3D9/sX5UMbD8o
         jFNd7kyWcjQ8+yEx1nqa1PPhTWf1EXOWXYzPD5WOMk/b0hIuegIeUUc5c5K+wbhpX4ab
         HH4s3W68jEZQCJ2jWSiNtg79Q7thlSu2EiEudWpcjhWpHT08aJjVlYZ4322eB9TyjO0W
         FA9xMFKkMcb2oD9+MVEP16ZjsysSM5bAQqM6FOj+mwUmT6htjypbc3kZ69hnWgL9KA8v
         TXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688494; x=1796293294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=SwPN7EafWt2/9nOSsdjeSIgGuCC5Ajh9e1q+8pChGEcjUVqXPebGLF8sTj470Pnt19
         RuCSLXjFEV3T6cHOd9OeTXCAUjgcGmOlFUaZr4aqRypEX/2ftzdTY5vUtTMvuD/CXQWk
         LU3ewNbv1Q/fzWIsWpR/OT3IJt7a8R4g82XLNUZKy+MyhEqLB+Kg0qNWf2VI4YE6RIt+
         W6AzJp5TH5GDRxThjo/1weDPM6CyTyBpyrSGKDAzWTc8WPiwkgdfbIMplhTlThpm49MV
         nxXIPohEV+ig9niNEQ6mjPhk70Ph6hvNST1aA/gVHBtmO9zbwfaF50LNiJEya2fHbW1P
         k/Dg==
X-Forwarded-Encrypted: i=1; AL+hErE+MUDLoLVFl+zimp9m+YDnG9T4ni3GuzxV9cfz/n6au7mPWaqWwYEl/hyf5Tq/zsZ1AREi1aF5UEya@vger.kernel.org
X-Gm-Message-State: APuU4Z/z/iyE4kBc1RLYyKuRkYX8rA44ACOAczOFVWJ5XJZZWOCtRJET
	C0uqgUXQbResPDtIf4KMdeqP93NjYqRGctp1ey0RpqMQ/KZGN5pcetM7we1ovMgjHBzjfzVZ2dV
	mOmzI2I1XHc7MXrOYnL9sKyEk7pwQqFZfD4GdmJsxn3ZdSQ5bnoQPuQimItuYPlum
X-Gm-Gg: AZFdTZeWxO4Gw5G81f2FtTsE6JR6UT/PRvQ/ZbSZoB6fSjHYg0RyNcU4jEFHCSt2rsv
	OefV2lbE8A2Opq4PBudzQ9Te1+vbHhX1ckkgJrLr+FpaGWq4WaHxsQKswPxaBL/57IssbVgD/jd
	Hq1KcDhmXDdCtP9ERsIArhdxT9cT2cEXFsmk+2sDU7S5WEmbwmBags2j23ckSRjbTg8m7xVa6VH
	GaaavegRFy41plidxCZIXMs3AbaBl35c4GLsTAc4SLoNzSc+lHBTYrt/QfObvTUNuo25208ZZly
	oDWWY1A3zaEgXoKlEl0cKdMjAGGLV/BOmBjZL8j4Bj0NVh4xkm35kWcHKCme/rbWj5OeHuuxad5
	gN4ksfJvpb2ZZYSCGf19fZ4Mh4CSUGilSykGvh7VR9hIZvsMETy83xfRoaYXszc0kQZyfABEuoD
	GgM0drV3Li+XKooLGR+UVZKYfBFbSDzu0fHD6VtQEgjqsnaTsg2sNcHUdIR7fTWB4=
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660774985a.3.1795688494582;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660772785a.3.1795688494138;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:13 +0100
Subject: [PATCH v2 09/11] dt-bindings: pinctrl: qcom,sm6115-tlmm: add the
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-9-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e9gjgqmVN35E5q0f7mN/S2W0FHM2q0sIPfb/NwIZsDY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUMf9wAz3+gAYQ4L+1woh512FKHLaK/5WlU
 gQxjs4MeRuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w4tfEAC2OmBzTNpcwCg0T3PcYTt4Y31jc2RW3ocrqYHLNzjb1D+6lwpvptIwnvhwoHLxFiUvovH
 gBxZtowt9Kji9tvcxrNVSe9vGLJxnXWEz7mc+1sHxh8+v+kWpXOLTsYKLKtrshjnAwWbs8cztyt
 zBVXnVWqT9JQtcgpChy9VyPH6eppanW6FOjcn/EJ5CoicdRED2pjO4Ttq9H7tI9hltcrZNVXVX+
 wc/XS1s3I7oeflzyqzDia/0qZsjeY1hDVpnmME9cvuzKWWPDfqevcNf67o6Ml2avc61gCtwP11S
 NRJZrq0KQ3v5Si37e6rZYthJhmhuDd2NmWvL55dZJOnRVuHu9S6/r4Ko57A8dayJlB/hJda9PsT
 B9/mT7PcjynQdm2Nw0bCHQKONFbqPuoCEM8JKhW6aXbp5NrP0bdyxx0pYQrWOpbfwV+RcK/8YRs
 O6E2REScmXME5QPzhBSZYW0+TS7pWgUUYzHfKvC5rpn3dDYbGi7t55zqizkc03hz/9QUjWi6FO0
 pVEXCgA8XNssfgD748VYjIceGEV9PkdYht/1vIfoyjdY+TpD4DE5JTp3wTKQZScg811WpuvfZHt
 lwlJ1nXEq11YqbAHD+r6pOiSfGIafuxEfVQ4k3fh94AuC0inaIyt52krccxe7pxP+M8coQeS27O
 /PunhGBAUwW915Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+YUzDNDvYeeI
 HW0PPp/G0te/wnR8LHcseEIwMBqHr8oxin8Ujg8Mh9HQVVYT4vqYSqtlJmwvpLqoQWbfXbW05tQ
 Fd0Kri3T+2PEWpCbndrgPJBrjEeGWIlY0td3r4OVKpLptiBfA6hLsEK9yxE3eMTlxAAefO8caMg
 BOgujAVm1Boxsw8wb7/gzkzdoXEt3REAHmK9m+9A+xM9VsjGLyNzrI1gZ+1Ii4ckwgqP14ylOLZ
 ExdYxLh+Geu2OUBz9gfjilPbslogxQktK8qTnXarCm3owghfBEg+Bc/YEwKHqxe3isz4YK3RdiZ
 vLQIxWjoo1R3PGBET4j5wveKygBVkKXRhrlI0WFNyNknZWco753bSBzlc3cxxZ6WX7pj84y27zV
 BU3o92X0ReA0f6Qjuct5yx2nFa/BHj7Fm/TlHcO8K6jZJP57Gg4LBNNy4wkkdvEbtSkPLmylZcb
 bB+Br8phA/WqeCra0CA==
X-Proofpoint-GUID: Lj0ChVdlvQgo7liRM8iJhdMZEOcQVIMw
X-Proofpoint-ORIG-GUID: Lj0ChVdlvQgo7liRM8iJhdMZEOcQVIMw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3sraICZo2Oax
 TVlFTEnxS8/GIvXNQnDQrgDzenq01KdMvIMk9Jri6WPPpNoW3DUz/5dXlLiOpisLlHI2n4Bi8yJ
 7t4QJhui71frhShLuWGOCKXmns1UV5A=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08082f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qcRaLMgUlmIIbR5VUokA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm6115 TLMM controller supports the egpio function but it's missing
from the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
index 7f36f9b933330937ef9d7b334b041174f9617ec6..0b0ae54c0cc60275b914f4a2e4748e0e339e6ca3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
@@ -69,8 +69,8 @@ $defs:
 
         enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
                 cci_timer, cri_trng, dac_calib, dbg_out, ddr_bist, ddr_pxi0,
-                ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
                 mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1, mpm_pwr, mss_lte,
                 m_voc, nav_gpio, pa_indicator, pbs, pbs_out, phase_flag,
                 pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti,

-- 
2.47.3

