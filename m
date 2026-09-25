Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3A19D074
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316845; cv=none; b=NbQdse9genaNvO6jox4SY//vl9k6XVoqk6K3/NR4L/NPzuXjNVqevTehePTQuCsdMqAA5BSSTUhb/+iPkRKZ864IC+lIRmBFizuIC68Cb6qn1R579oFQCwhUe0bPqBkifEdBZMmRwR7a4maNgJ9QvT/pEym8wxYijQDKXAeRmdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316845; c=relaxed/simple;
	bh=UjGi/HMvFFK7HvhdtN4vEXbxfXMe3CYhjl57nk0EeHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRrEACWjNxnFJewYMVlFsQskwFZg/n1mgQ8Y2A3DhS4dpIdm4bO3fUSsuiuOe/FaxI10MUQ3Uy89uka38wjGHnjvGzNZoDGo11LAUXq+Ish62557aixooLFSYJaKfbr6j9ndd4HJqBZCAB6UEGnq1451Kefoic04Ft9SibChf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH6TSXss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi7dizQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH6TSXss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi7dizQX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YTne3736784
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=; b=nH6TSXssISO1VdTW
	5xDNZiYO9tAqBZCtVULnbwsTgVLsioytLqXVS2cdERf8Ge6rMDQlcFh8v74hAWvL
	NWvxLHFNCTbW7ud84WorlBfQPbrcPf7SvvSU9qjXt4I8n+ChmPJj9UNuUUhqrpX8
	EpZBsOJce5r+Moay6Ki+NqfTGQwpWNfCjZYz60cfu0CCEicM1m6fZeF/bLs0xqmW
	aBel0DzgfiLtdW3mEE2og7Xs/Dv5Q7derW5GzBgFBg9EzC3PbS36ihBxxxzL9fA9
	dN3Dpy7vR9fOeqUoiL0XD7qZwnLMFZnBqZa0Su5LJTiWZIDvWpAVKOZZ5JyEtnfT
	CRKyuw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e2xk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2168612eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316843; x=1790921643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=;
        b=Oi7dizQXeu5xF2VxoSY58o9GbDJA7mM6hqsXkvfUFyJhJp/5aDtNpHeOPyOuLQ5+BG
         iwZDr6dgvWNo3fw+5cMzl0/cPaPJv5xd9MM37HSE7hFhnhmgNW7THOb7sLYpFjXM7f9K
         HfKoV/bYr9QaItDUiwGa3V75JJFpwx+Q9d2VN8jJf/pQWXquERo6pIS8u/FBKGVaWOWt
         6tTakKZ5pcNYiH/Eu17S7mfzmxxEUCAL06YYuvLyCtsZqbjCctA8WzqPYnLJCznzQoCZ
         bzdkheUhbNlGIy+RIPQ5iwRcBCfc/VJsd6iymRvkSpZSPnNZomV/XZtxfLUKzEAfzCsX
         V0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316843; x=1790921643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=;
        b=NyF5ooYKAyb3WsCou6+XYqMxo5+GREyu5xZO+kvIffUfaXw7xH7rv17qxj553rqD+b
         6B416jgCfb5Narxja2Dsezs3GjGWXgGzQ6etW2ogh2g2ilZ5jT5kWxGIjOz3b0FEvlgM
         6J/ZIbYGhBeQmrmUErNTFtKIVG93RZeSNLxSZUAGgwc4y8U/jebdApg4nQLGapcjZxdJ
         +A40jh3SCHOtz+sZofiCZ6MsmkwxKDNfLdSU5abAN4wYUlFB5oMyxlwoSmvjALCmEPXE
         2/KdUt+x/QfmrN3WJlpPbywKJnC9U8sqIx4P2yGEl5JPnyJytyKJXtZvZaRsau2a78gD
         8Z4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5a20fKmqbwFCD9L6/3kOv19S9lohTACPhcPh2ysZxczrCHirh4S49mYdqUe4T/8db39a6+gRPV0bL@vger.kernel.org
X-Gm-Message-State: AFuF++lu2kRHRP3f0F+NX0aFFwbVN+YGs9Jcg4ud08WkHwZT0q7gBZ/f
	aN3O1/Mx81x/5+XrgfF5R5HhmokntxMHz5vmIfeDlpc/h9raexsDh+IYN1djugHl3QmjEEUqPd/
	ho3NEKSFbdmZyzfYU9coRXUEq0wgVDtEtDJn/bJOQJeankHxb5DCNqjXM+WYmrsTlCU+zY90g
X-Gm-Gg: AYBFou3PaTuy/4VxCpr3R4lJ1f+UQiyw3S5R/ejc/879JJYnGzkUGTotw9LzDBvsbn+
	ZyWNqQcpvn/ZK9chBoFEdBsKyDn6p2gsshAZD42wzAIABEXN5WFjkrgky8w7p/zYFnx1h7gcUmY
	OUM/Vz59HcOdjZbASoVD3fZFJCZ1oDBYCkwD+ZcpXIgUZlFma9EKjbLl8n3bEwhm28+c77d8PZ2
	zJGuKvs0Qw1qet+1SpPX/wTU9jP/4u8GxGqCA+vzJSft5s/4A/fP0vcFbT9s2YDRM+HqEFmG0Um
	et232oQWDWApnfizdQuPQjOipvqyHxdGEPREl3SOUe8BYr53nNBLPKREUyk+Bh/1mJPtQXP18Z6
	EfE0nNf5rwgaEs/ynqP/GoC37MOGN
X-Received: by 2002:a05:693c:42c8:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-340039b520fmr3853558eec.29.1790316842712;
        Thu, 24 Sep 2026 23:14:02 -0700 (PDT)
X-Received: by 2002:a05:693c:42c8:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-340039b520fmr3853524eec.29.1790316842076;
        Thu, 24 Sep 2026 23:14:02 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:14:01 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:43:34 +0530
Subject: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316831; l=2346;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=UjGi/HMvFFK7HvhdtN4vEXbxfXMe3CYhjl57nk0EeHw=;
 b=v5wS0OGTviMTA0Yll3u5cZKAy9TX62AW4w34Zv0X0znfQKBDbHeemzVcNgzH5R/fuzZp79wyZ
 pKEcAa5592qBxbqPbTKGJY8O13FaVNBbCxeFyyQ1aLFrHjMLS+iZCG4
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXzHDzWyEeDY7U
 NIXpsfV+TuhYV3dx4ywpGOwRUo7kMb6IqOeNrvnsYP9t/ARwN0/gTa8sa0AvoZPH2Ez5XQgkJnS
 qamLdI6RuwWE3GAzfZe0JDZnO3ESyetfoJDRyQsZNXZqzL9QXtd4XoPwBpth1RVU216hWfhx4oe
 m5UMl5GH6/EwY7VuO3MZM/FiAca1uN3gEMOWaQfpp7QgyBdHMUCHTgeuBIzAWtRq54oLZLlSRbi
 bryRPWWtk7qVmOJbWzwWnXSih3FnM9+AMEwKFGozNvp9KM+bJp03nFL96P/7p5sGAFvOUwGmmHO
 W/VBBCui7D91bacIqohb94M+YCZmWO+aa/uIwXgFqhMIR1iwaW/Q1Jn0kzeUAEmWPNVVQ/WVtwW
 IH5nVb4+WS30xoEJM0PboAbbBbQiovCQ5QBJMecNtaE9aumz4BZeBTtOO1GUbpsMsADvEjHUKH5
 qIwaTREQYLPQCFaFtow==
X-Proofpoint-GUID: hS1ROEz8nhbUOhsHbuhVIlK2bq1GUyLo
X-Proofpoint-ORIG-GUID: hS1ROEz8nhbUOhsHbuhVIlK2bq1GUyLo
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab6112b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZKVZgszskm7KUbKj4J4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX7C78LDh9+MPv
 lCUHiW8qmjjbMYQdWX0I7xGjSowPpHdZ0HKx6D/lkoysJWLQaDv8CzWGfh/mqGIpsBoOx0LpBIE
 jjf9eq5jxKfEbJvV5eVKmtv1YmTAIgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024

RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
power path in hci_qca did not need to explicitly manage the clock.
With proxy vote removal, each consumer must explicitly enable and disable
its required clocks.

Extend the pwrseq-based power path to acquire and manage an optional
WCN clock. In qca_serdev_probe(), acquire the clock using
devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
after a successful pwrseq_enable() with proper rollback on failure.
In qca_power_off(), disable the clock before pwrseq_disable().

Targets that do not define a clock in DTS are unaffected since
devm_clk_get_optional() returns NULL and all clock operations are
guarded accordingly.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..489a059e519a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
 	}
 
 	if (power && power->pwrseq) {
+		if (qcadev->susclk)
+			clk_disable_unprepare(qcadev->susclk);
 		pwrseq_disable(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	struct qca_power *power = qcadev->bt_power;
 	int ret;
 
-	if (power->pwrseq)
-		return pwrseq_enable(power->pwrseq);
+	if (power->pwrseq) {
+		ret = pwrseq_enable(power->pwrseq);
+		if (ret)
+			return ret;
+		if (qcadev->susclk) {
+			ret = clk_prepare_enable(qcadev->susclk);
+			if (ret)
+				pwrseq_disable(power->pwrseq);
+		}
+		return ret;
+	}
 
 	/* Already enabled */
 	if (power->vregs_on)
@@ -2472,8 +2483,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 */
 			if (IS_ERR(qcadev->bt_power->pwrseq))
 				qcadev->bt_power->pwrseq = NULL;
-			else
+			else {
+				qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+				if (IS_ERR(qcadev->susclk)) {
+					dev_err(&serdev->dev, "failed to acquire clk\n");
+					return PTR_ERR(qcadev->susclk);
+				}
 				break;
+			}
 		}
 
 		qcadev->bt_power->dev = &serdev->dev;

-- 
2.34.1

