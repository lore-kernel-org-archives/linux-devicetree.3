Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD9368D79
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971600; cv=none; b=tEDohm/SMBGNcorJ0jFEslJaE2/bgOi7Wm6VMFiAnEqBlqpaPW/0guT9gvxc/F8rOaCbCOkhxpKqOBKFRmLyKXqXd8wgkiopR7H1AiJxmvuQnxCnUmPqYWmHP6ZHRCLcO+EImJCH4XDfQCKrdvTxnr/zr9c5L9KtFQqMv52hygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971600; c=relaxed/simple;
	bh=80/vGrZ3GHUbldEoaZPJNavu/WmYAHTn//dUWIpRDOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtiLcrDE0TdL/f5D0E/hZHLATRvGjSnJ8zTucXqTVNp3HTVzle3O+7wDO5gp/7kND+Mtx36CKrbdrK3cdSomvI8iWE8KcgeGg5kQ9+b0LdW7XIIrvVfsViHRBFMNDXsmZHVl1sgZvDBmo9HAcW3qnMIpfCWgr/qIVaxvhOJ9kRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuIfRqk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLJngAd8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuIfRqk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLJngAd8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3YwdJ142180
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=; b=PuIfRqk2QP7HSOZk
	fTqbFM0wMZMvB6w2T08iTyr8zCAicKvM6dtlrZi6ePtwujzaHOKEGA8lFIkxVua8
	jX52Sc++aqRjyeoz/zr290QvTyAinTbuetZ/PIO2XplgAllWjMVm2RMdZQZ5q9i4
	iAf+nzTBs/7SCd1aAiSoq8uM+Lee+n3FQKLo9DdTlawuYWmgo6pjRse7fa0IAplM
	jlOf+gW8S161jhqR4CaeMIZ5vDfpj49UgVaLEm11EbP3ZD9CNF3tDe/piB5doOOJ
	l9p5zg5az0xH5kZIOZvLmogUwM2wBi5tWoCQ39hdCQrv0BmcnMXAZXllWs1QjB+s
	BamGjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1egt4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:19:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1972840a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971594; x=1790576394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=RLJngAd8aW8Rv3v+eRUk7yYZ2EB+5cYbkx7RtG6rQ6aZ/nnNZtTRGiYPigKOA52N7L
         DanEp4n91DSEsNXZRw+86pEluPAawm7azkjcoEhcBNAs2ANvNaeLWLUomx79nzDfPJRA
         FQnVXS7XkzrsM9LBmSYHbV/HERGBZ6zvHQlFgsrUwfxOwxMXqgzJItBPNUr2LRVKkWxR
         tnmklhxfpQl2tCzuyEHWccC/4ID6QhGaZEKqt6T6bSSpxpMNgF03Hv3oSuqAqxmBuoi6
         CMnhQK9BJCi8b3pkwfrN4U76WjcBs4dBFnEfFmrfq100F3GsdVoZo9JwG2JK0TYra5Td
         f/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971594; x=1790576394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=wTY87ln/0yLVO/NBw5UvkQzyUOdg4YmSXh9DZhCzGtkigflk+K2FlmaGKN8o/8nwxv
         5keCTJoD1IVNUCSby7Wp5Hrk/uJ9jc8wWFYDLV9+FV2vnQXo27pqPxspMKogBN6TPd14
         km3XSJoK1XNZiR5rLOmUwL2k93KxEDRWwzuA4mi2LWV/hL5QE0wlpZzgK7UFf/EPMauz
         v/x2hz5w4h3YfjJWalSv3dxxtHK+L+uBHvPowgKDOoOhUFNtc0/qLlFjWfGkQ5OZGADq
         RLxNf9SC3CvqaqE9DIxrDE2E183FFT7LunfCmKHEEKDgfjw30qBWv7F/Pq6uvlyX2wdI
         7ikg==
X-Forwarded-Encrypted: i=1; AKwUvBz9WHSDFhWhMkNZDZqKjOZy0VgKrEnqzlrM1rePvxtnjwNaoMB+0OxmhWn1/60PFGRXCXx+nSV1uCD0@vger.kernel.org
X-Gm-Message-State: AFuF++kSvUcKWxJJDXk9UE1y7smMEBqX5LiCkPccUcExMZjsnay9EgSp
	WEvhnSk8MAAAD6lTZhDAAEwMvbffuIkhpfrYsuqsyANFGFrZ6ryw4TF6I2p9O/JYq3WUmeBPMcT
	/DoTLNLhBO8j0OdNYnt4jVzxCNYSa0Ht9V74aG+iQFo1N7aXbFHM4Re4GVfCJJSmI
X-Gm-Gg: AYBFou0UR+0gk0KaiL9PYBRJiW4oJjCxsszu+9qIsOvhrcbOQJfNNfdwobG2jsUhC2c
	8ibHOc2W8jOyWez9ZYCOaLBSy7IlRqEinZcZQJCwGSgDAOo18KXSVMAygJdG54MZxKNfdYfwlVV
	TgMKIY85cmZ+OLhfe+T1uZ+mEBd7IplsLiePegBFygDYqiJgC/vrlL5V4XiQoRkLBLi8XN5Bc3z
	YN4uCdu/NRd9K8sFQtbyLngq6RJQZE+gf+umQ90NtDnnn8Emdtfc9ecWJMtxB5SBG0QI6nKvEoZ
	XzgpelTitib340kVxdm0Y2BN4bNBIAiSdO36+p1A/7Sx0wetZZQpjlN1nnj3pbb5QifIDPgBDAu
	YvqpQK1/QPQ35BF9Xd3jBMmy/6/XCB8jujU9xT47JfX+n3cliratEn2dZOFhdsa4//l3n/ihaJd
	/6gRiX+GfGv/Z/1klIWtxt80yMK9eAOqe/NA==
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840847637.60.1789971593732;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840824637.60.1789971593315;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:34 +0530
Subject: [PATCH 01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-1-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX6r3gqiErbeAC
 xSK2leLnZBFY8KyGM1CzFg+eae3AvlwOJvm7jcpJdSpnjdAKMEpjwjCJnQXFjccvEeqjNhKV5g+
 yRHy9dsqKQlEI1MMEY/N61y6NFR2C1w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwN+BWKEQgXAJ
 FxT3+BTNn8xDhtbSxAdfKN4fkm0D4Rd98M/2kUIHUxANgIjBl4jFrZVRyi93rxs4kWffGGfa2R8
 Ktwxtwim1WXq6F2Av3nORF/jrEAHuq/u6Z1RLCc7UA3NBA28mWvU6RJJYYoZ+/4Z+BsvDsOyMbr
 QwgR4JZGMXHKLbvhAY+EDqm/ZqG653PzKZfcYdrQLxYefDv3Iia4GT3QopaBk/dUl2RlDPlaAtj
 VrrFgQgZWoDjOw/ScEpOkK5U60vh8+ZHfUDmLhhuM3rk4lVdD9wJ2I/6mWM1LicWuD3AHbFt1ID
 O+gqqGT6/5AQVK0ROdyw77uVedvxN+paMzDZYFqyZ9RBy1hBOxsah+/xpXMSLjuqjGZn5NQYW0O
 +a5nu35DkFFXFx+p4g852d1IpUCO2dmzMsppwcHmzazuhLOpNDkgJ0OBv+lFtcS4k6IU5HC8UMi
 kUyVC6S5/TfvAm7mo4Q==
X-Proofpoint-ORIG-GUID: JRwN5UuG5v6Jqni6MirOgmKsY1KF2grS
X-Proofpoint-GUID: JRwN5UuG5v6Jqni6MirOgmKsY1KF2grS
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0cc8e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 594dae3bac4c..7d0889eeffd5 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1260,6 +1260,7 @@ static struct clk_rcg2 usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

