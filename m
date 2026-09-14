Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433BE3921F6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369225; cv=none; b=rP5iXjBCZ84VscWdViCDLQDx9Qmjfp0Pk6VUWpopURUBwWLiL4Ba5JucdaymsdMQuLtgWHzONPBbvORwWwfKnaREwv+OYubNWbTjAO+8oQx+xjcF+552cpcd/bMNZx+c8k28jQkGqdVBFkJmgA0DH2xNOK2Etv0Cf6MFW50f+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369225; c=relaxed/simple;
	bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBy98xOq3qH+3EEy0hs3og4PzfqDj/qR/0k1GdtsN5uZ4wP2wVSJQW+Sl3FtN8M/utucm/aAQUTktwZYIbeovpbQdMaPE0KCkRVXPrfhHuJw4/+KyCUU105Vx0t2SH8/KzhL6rZ0SKBCCwlakIkKE148jHUhHrCrmjprOK7Myd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcNzPEMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZAZNhTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcNzPEMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZAZNhTx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jYrK237710
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=; b=hcNzPEMja0guthTW
	bPdxXJWnkoGV2nGbEPWr7knTjiYDDtA5h9AqjsLxC8eqhpl+XQD0Q8ReBpkVrLGg
	wCqlGESe6gcC703NAL0IkN5w2FFqLM9IDrxJ3Ng4fsFRqWFD/eHSmHWry62XKx7D
	oCrb/zzhAts+zoD82dUo8DpcMHkpPX+2SXJ1RSsvvkueftw+KNhF9+vKwfRPSHy+
	oP+ybfBP71+UYpJ4/ptJSynYDVcz+xUqeUuWK3yapwEzUSM//lVuWauIbdXNRjje
	Aa4SNh4TEmnfyLg/IQsweuvlUQ25HugeZtWm9PUPZahezFtFNr6GXUYbERS7rs6D
	iyPMlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnejg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so42916465ad.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369211; x=1789974011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=YZAZNhTxQ/asQ8hC38EE2DJ9L/5h5b7kDMJDt5GKudCplEBPGAy0rpUhXsEtKWqnvo
         1fBC5FFWggpqpMfjQP+37yL7fHO+rdruwTLti75SYDKGH+Lg11Z5/G8nj+G//XGTyMpx
         XbbN9BbI3Hqc/omuMmQlSA1525PlpxnB2h3aBG0YsXaMMADzjQ5Ls3YDNoDQ489TZmM9
         +bz6xbs63gypq4yk6o/mrp9UaHy0vUFN8oer7zgfRqwSw7hOL4mVt7pBc2SvqjaDpPJh
         w+ATLmK114rzU6IeRHbCR9l0Fs7lKFwnacduiNhSBCV0oHrUoKDo6CHePur7jaRKd4rg
         9XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369211; x=1789974011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=GZ+rwDOIlD5bGVdhG7XNHqYToTeRJ2vv/IvvW/Q/PbS1FbfePPQZvEUdxfwA4mMGOZ
         vZDGZNYQ8FfPR+MYqLHsi+ZZHH0mx65UI3mLoA6I6LrBDyLRkq9MpmcLEPwb02a8Qwco
         SCfg1gb4CozKN0SeerJYGcOEpa7J5Udc6wQQLttnHqjTjsKZlEAgqFRweZ7bcRx7pDAm
         lMot8mYA56VRbtt/tfG/coWxgMqsAkaYcO9t8ml4PgYRks4nhmyQ291DOJ6Y0jDHWhSU
         VZWkoUet6yDDSSn3X8B9LE8qYYOEl50I4btIGLoKhP7i7znNS/FKzLFtCrT3BuNkJPhi
         WHOw==
X-Forwarded-Encrypted: i=1; AKwUvBw41S9VI2ioDAxum4p8ryGYdue81jA5mM55ZOUs4TdHzChU28YtdizUoyc0R4FhHB/B8TW/Cq4U3Z6w@vger.kernel.org
X-Gm-Message-State: AFuF++kfz/PlLt2eOhur5gLmjEGyoFIwNuU+joUpId1AvfcZIZ2FdiFt
	a3ZefACpPxqBvXzJe7RDNxG4cQ5XpsWIa6Im3z61lZrr4+k7GW0ku0YQbf9yXBBvt3lKp7HAe7G
	GhWEgVtJBRygSIjVksXnSHAvEG2MSGaFrN9HlFyXBwKeYQ6sETGvjlK2hNYIixDBCBZLWNQYP
X-Gm-Gg: AYBFou1ONxO8jcJPDnPwL5xZMURAXVMwDMUWFekMxtJLrZld0yVrpEmO+VDDa8O0L5e
	DXMtBN8JpuvLVEjmT+b2IuqaZm9s/6gYRfNkm/A4EuVS89uF1PvUBg1zCistwydCruvyqhXSanF
	CCaFCrEZn+PEVZ9kP3dp0WZDnZMoEIRfJRJmursDUrLgZDY+YofjpasHxirtv8dEuYdgx33jOK1
	o+yhgTRPMmdUIJJrgwN1UowO5xYgDDfLQtieUaHYPfuwERjkmLG+V65aGdD/HjwKhVTzzpK4Xja
	RmpbA4ph5+TAQxt05HY3UetbkxlJx97CUtU4xYMoFN5PIqjXw8W4NutuUYA5BVw0h4Hk6xjlWX6
	pfLQ88FxkqC7UnE2EXrs748PZxee1
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29404865ad.22.1789369210837;
        Mon, 14 Sep 2026 00:00:10 -0700 (PDT)
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29403925ad.22.1789369210321;
        Mon, 14 Sep 2026 00:00:10 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:09 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:37 +0530
Subject: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1106;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
 b=r/5QFOmiZarwnV8piFgE8vq40uBxz83uxjbp/ILTsQ4yBCbfeHHcUCcRKiC0n7tTlJZrBlgIF
 pmLT8COwNSiBpuw1UE4lEGOhENwYDlxDNWF1OANDndXqgU3Wir7kUT2
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: u98sSRCLXV5lvSiWBVJrMpkStC65yIME
X-Proofpoint-ORIG-GUID: u98sSRCLXV5lvSiWBVJrMpkStC65yIME
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa79b7b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX2Z8N/tAGb2wG
 wZr+d/h5P/7ATC0mdDaGMuE92CYJAWMk0Oup/u7pi8XfPtkL76h4/jPds/0dZVNxnMSNbbslOKF
 sUfqQBvKN//XbIrq21LJgXawgAdpD2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX7qLmQWZuQP9x
 EqUdSrOfLAopOB8XfTQmWJ55h6FTwLVPlvHtUMZKnwTdn5t8ifgNYCAM+fE3poc5WrMAb29sEU7
 HPUkMVWJvHsaOdOyVpT+anlLZMBdPWuA+AZWKvryCCJMCJNN2JGIJkgTdFaO7a7Cx8b1yuwEH7t
 c9sLl9wThJWNVPZWOvdp7WcTA9rCNW73Zykmwa6SXxnt80uoSnqVMhgoRN0UDFaYI+/IFVftIZZ
 /pYODZyzNiCdMoNw4//TLUYQc1xy83SuXa7AyXfVrHXNbY3AiHK0JaX3HsXNcYx0X2bgaV8fRdp
 OSZAhy9XXo3ReAMjtYuhuzqYQJhc71TN6/ZKFEpG/1MkrNY5Zx8LVAg7YqXy8pq//vZVu0HVwCh
 9j/ubMzPbcwIolQ+lNbso2cKxFRoYbLMBkDqQwNmXcW4fMR/TEwsTJ7t2+5GIpJKZaK1QqfUuzR
 IKTUkCCG5aXQGnZtbWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7dedace8c3c4..68e06443e91c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -369,6 +369,7 @@ cpu_c4: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;
@@ -377,6 +378,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

