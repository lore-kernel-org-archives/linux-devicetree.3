Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6A13876A0
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379454; cv=none; b=dbUktzMJfrm6PD2WDBgR6TRQ5qlcbHzZfDKTf58gs3eWakOQxoRxDNdg2UY9jJB4IwKi7660URGIscSTQ9byr13UJK17I3UgpElPZ4gYfBcz1whwGGoFB5w+Ldl29RlVdg751ASp4EXY4NTnUFtrWQNlE/FCO50nPtG0hhc+51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379454; c=relaxed/simple;
	bh=+XxCxyuet7T3qjrE5preDyooRigNRSPFJmQPD6VhA2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2mlF7U0mttV/N+uwPtVzR8d1u8wq0k52s6LIruglQGgLdsvJtJHh01nugdex7CLNW8bCAxnvxVi5FmNiyzLH/OkV75Esw/j+0Vt20P77+/q+0EU0E6rTy6VjzHuasU/0hE7gZBFoldjfvDM7e3ZbJV0TDnsQ6HUgy3Ry6ktOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVDvJyBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij1TBII7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVDvJyBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ij1TBII7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHUY4178722
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=; b=KVDvJyBEHp6OphM4
	cMnVHmrfW39oLgDJ29V9qyhUwFuveLPARJrAYQeCOCAhROqF9Dm8VaXzlg7ZhnIq
	3kylAvfLKOd9RSnJZBIbAjHeqHAcmOaHhek0fkQUpZVNPjmQLKT5ZkZ4HXkwuOnH
	aA5EOrZ23vjKGkhJr+WDpGutVK2EP3VrfmAV8Sgb0NHkpM6E7hk9UyXkcsBl0qHF
	aLvabE0hUeCvVktK1Gg2qr0Qff7z+n4xP7qfRNAhHxhcEm5FqFYuY3XANEwyUYQR
	aL4VervTMEDN7Ad9eWPAp0NMSzZZcY/lHt+yv9erka7x06p+Wm7ETqxm61CYhi1M
	pLGPoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e095fd889so10872049a91.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379452; x=1784984252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=ij1TBII7CKWd+Ll8YrZMJvJgfXqEbIbjCFgumlfBsTeKyyDcTRVDwMIGxSFJaxj17y
         8TBHEAIKJbky+C3Z5qekVChchMyaL5qAGYyZijQ+H95Sws8v7hFAPhq4NmSzbIeiZXzd
         eG0eqeMWa2QwnCNwXi05SakdFejnvZ5eAq1kYx9G/h71gxy39Rz359iQwz43ikJmXEIR
         R6kMRRvFbvExCjlTGVUfv/kk5FoSrjG3gDXMHOuBjU5o4fFOa8e6jJ+vQascgtsO2ZD2
         /DqsrN1TMrh/rxYPduKF6lKDN/isA3XzAVoQagb7NJKK+xaB4BboIvgvORuOgNFkp+U/
         qx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379452; x=1784984252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=gTj6O4DulbiIgULZ4KDFDq0q+Genk2s99rPQTHkkLe2HOEZBt9xCdkuI+c8BgpAW4b
         PcJnbqDaRKpvRMTUEzGchPBYNyIG5pXQf4V4prjqI8+keOZwP+8IHZHhNUY++auCP+1c
         UniSbhF5Jsx8PREVJAnY0QhWs87b7nDXtJzSpCakg7aiojwE8u+n71zsLZnVpk998HhG
         aZym+DbA/JwWvxbPZOXLtOSATLQTIy6sRIhR0WpymETDcHj4mFcYUt7hY7x7K0tL6DCo
         kawbo4OonAdrNkSP7FrRIH04kk6eR+ydL2oTTZ/7aVk1U3uWaCCEqAaC/dX6bAvhM8Nh
         ltCA==
X-Forwarded-Encrypted: i=1; AHgh+RrrvI8ZKAEyaef6sBE1fIcNcg0ZbpON95O/xTUyQ4lkaSpGdmW6/SYRN5SCbGbiA5KSElTHglM4+rfB@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMsonVbqNl157G70AOQbGZ9cOMgra40AlgibBs6uWZ7gdczBA
	za0XFwwBTYDnWTu5ntrrP/a858WqF4DxfCY8cGtKxdituLo/YG0gKIUE7cvAsfCo4epFQBK5rvw
	tZRY10GkfzPmHJQAjOIqHJ2sATKMqISGSrM4+xDmu0vWjLLVoTfCE0bicISlZCr7B
X-Gm-Gg: AfdE7ckPOw900PpbZ6HQmJ+LXsdztVACwHHe88qOr9+07trMxLOhJQioyUVqHxUbxUs
	qqQSdqG/HLh8r/mq6Adm45iQq24JMv0ccWLfGBbveIyCgnNrVdx5cUFGsl/hlLD5M9GfyCbZlPd
	QYoklCj1tg6+W6SHBIFM4jhGijp6G96ujlbk42wly/yJ4z0UioTdY0jF1K9aTwM42jH0sQrj9Cr
	3KCEql3lIzB1i9cs1XVAEdseegYvfg9jG2RUSUvctrlplJa0EZ+PhfMY16phksylYbIbYXlepjW
	u6gE+xun6aoFYfVNZnmC9qh7+2TYvl9vDIJkKeIiCmQZbKwJA0cUAZyvwv6kp2ny4HY8KYYuysd
	v8hSb0qH6DlQR+yQHcOosYzWe742NzLA=
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280487a91.23.1784379452083;
        Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280449a91.23.1784379451690;
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:18 +0530
Subject: [PATCH v6 11/16] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-11-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX8j1+H7jBrFdL
 SfLk1/ZRV7+0XWGtlmMsmzlS+tmq8p3LXiDTzlaUgOd/l+9E+bbNibcET4QszYpMkCbhtE/SYt+
 p25nnc+pz2FGdCFCsKnSzU1IGR1v/xqF//aUPZNu8TqytNy09oV/dbIfGrSn9ZhowY9rKsFq8WF
 jhUaUO20dNzZjAged9FPxMtNXj2wSed/lc8VXWAyS+2t6KkzeJB4f4cUYkB+LzQaimhnXlNTJfB
 85SxYYPE0BDZ3bpyrH1Yu/VptKDF/606rGjaAqfucHjkadNaf7Ofl6EKlogneY4Fbf6ZGJb1pR/
 lWnqMTdmA1Tj0wT+XCcMG4yJeKxI8fXiJcJPbEJxgqrd/sIrowLyi95aYvEpVwuqK0rbiBTbbFj
 ysTb6F2VBokrFzM7TbP4Oc92Omg51FYqJVKAUe2I9hccJoM7tVeB6Sj8Qu1ShUSIdBERIs0N/1K
 y85wc/Kp5Kb/K+Bhwcg==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b783c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: kO13Xr3-0MlZvtqWH_XBHLYALXAaIzlP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXy9rpTZy6GEAh
 jL0DWwglJJ39R5AoY1W64TPw05axFKM2FT3wbA5V2hjw6HiuHOSC53ISJu8sU0WyZRyxNamOrmJ
 RsOqsi1t4adfUCqnkVlCHINw6hwsKDA=
X-Proofpoint-GUID: kO13Xr3-0MlZvtqWH_XBHLYALXAaIzlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The RCG's clk src has to be parked at XO while disabling as per hardware
team's recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

