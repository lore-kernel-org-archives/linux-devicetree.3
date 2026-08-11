Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1542F709
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455424; cv=none; b=JTLtcT3jUtX8Yz0pictTtuHdXXivOgLr8gE2HwHTv6CR/0XuxIFpm9FI/AT1sCHsbv76Aavm3zUiWMZFkauB/2GQvg39fu7R9qUsIUxcRC1cQRQVnQ89yOCr5/MEW4eRM5GzeBANUubyk7h/5PQZhYrOVu5dHSvxZAsjkl3qInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455424; c=relaxed/simple;
	bh=ryf8Hd4nI6jqhAT1OBjk5xfOQnB0C6q+0/GQIGWdgsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=th0iNBwI7ji4qsA4Bv61v+2YbaDqAW221BkOAiBOIeeUArianTLCGL84voIMhTHTsmhNf52MombQkWe1uW+4lbgpOwo7i9pdc7Ci5GURb66br7uzMpzzqpWt3CF+AZ77VzOG3lqLARI8egLu8ftiiX/UDKqk/DhIArXDWMAFso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHfArXoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOw9mzBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHfArXoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOw9mzBM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWaDl453540
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=; b=cHfArXoe1G1igSv4
	ewt79K0VVekUNzoomiOcEQWrTaeFUqUDcu9SOViG3o0wuhGlrokUYjzOMKOlFBw9
	AP6yD5fv/IiyYJ8gHqTz6xs6sHrW8cDklbvVxOnUOfHPtPGDTN5Rji5Y3MjxXCPi
	Ub+VcM7YtpcgM2CYs4hC1tVOMKcw5dkQ8LJeSFXh1L8cAfHR2xlWEYd2QoPe/MNh
	lyW1vyRQUpaF6kjyMaeOTGm/58IXboTzVhboURHfH4XOEgiCchwys1UBod/zjKiz
	nwdsddHtognwOB30uvsWpdNvSL7Mq7Q3VBREFC5xLSkCB98Z8pqKHvPiYBxxWXpy
	FPycjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg5cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so74085265ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455410; x=1787060210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=;
        b=eOw9mzBMx9kJNDkspxHSbExbAnwtaABs1NfVbnlfbq12BHrr+WEpvdh/551enfwu6s
         +6QlUWhpI2i3UHaMRRSKcSdwJ+VlkrPStTuk7KQGmxFCkBFnkTtWqARTxc/6c2uws4xL
         mL7hJS+jZpU8rNzbKmiq8l42yRSNEZsQ4hI33K8eqSW815TPad3Ddllr3i0UoP+l0yVt
         brVROD5NIuCmw3QKzFut5yVt/BzHzKm8cvBvRsgK6xRbnSXF1A4lScrudX1yVhprTC0a
         FqXagqQEpvIKumnoM9ghtod8Qf1J2U4pUwc8LA275aboBkhK5kVbjocyUNO8mDy9tAft
         r/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455410; x=1787060210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBKZTJRPc4aJNkS3BLkPLws3+8SnD6OJK/D31466cvo=;
        b=s1X+oiiZYj5yl1TXKg2JkHF1kt0vcgiE20GhYpIp5xgXpqCVzUKyZMMJpCSvvJiURy
         N2r7RcgUBZMIM5R+qiH48Splx7+YXjCysH/bDvvEQCQJi/N+Rl6Gvc40iegnPqhuFCQB
         afqP9sjttXdukj5grroraPzCmquHrzsol0SeqqczFa9oaUXOaueekL8uj7ZMYk987GwS
         PYlxatuUaIHRcwBqjpPm+mb5EtvatmP8ansLZiKIjL6F12vM4QW5ygze76qjtqM08syo
         mKqeIjqaiPGE40O3XDtbRkfTKeGCgMWe9nLvgxHudeSUNTgpItprby1CuaW/SBtnCULT
         SF9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+FzWa/C1MKtByhd7pRNMJFu6lZSrhK/bRBERZmrp0BWO9LNnVUHWDF7RxwasB9k2fiIyfveJQHiy9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAluenNmsAOjwIlxrcW2zu9SjURh/GONZD6MSUopC+znLs8ZY7
	ofViZo/MeQaFOgoorY/b6rIIrZIlTNqcF3xjzg3y69V8aDNf2hJHqZHml9ldriWp/+xH4W1ptiz
	FS6mo1crpTlZuHFRwBra8A+4EawwK3Up9Hfsk/OO415d42DsAzDjLI4aY1PRARk7C
X-Gm-Gg: AR+sD132CmfnyqG5xNlmH4BxWBiWlbyTRZxu2alDIbUP+Vgv1DnJTUsOMkFXaw/z5+h
	50yLX9nlkk4lOo1auPaatE8AXIvzZQCFwWlWHuYeze2AWxxYc6XyKSTcNsaQL38zfABTK75xHPt
	iKkMAsD26I0xCOL91OCaaskUjrNizX4M0EEkgEAYR7ABNODbWcH6Tvb7hp0APyN9t52Ff44W311
	QkNzVajYS2WwsTig2cX7N+B/0KFOQnZs3QZ3EkSIKftj4fFDepjpWapXNdfsaVZyoiof0Zk8wdq
	EB10ymEt/FJ/grpK6wGcR0SlKy4KwWrezZOxjNJD3tqhLymiNKrt4WIAxGv2A01obcQswyHfGJQ
	Xv7LaRp7Ip6hsdC5VMYqp/ZC51Qj3e/PuBsCnfSHLBE2+4l6FErrGYtCE
X-Received: by 2002:a17:902:ef4d:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3179824f5mr47183885ad.23.1786455409598;
        Tue, 11 Aug 2026 06:36:49 -0700 (PDT)
X-Received: by 2002:a17:902:ef4d:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3179824f5mr47182825ad.23.1786455409155;
        Tue, 11 Aug 2026 06:36:49 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:48 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:34 +0800
Subject: [PATCH RFC 05/15] arm_mpam: Fix device_node refcount in DT
 resource parsing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455321; l=1766;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ryf8Hd4nI6jqhAT1OBjk5xfOQnB0C6q+0/GQIGWdgsQ=;
 b=x5yeS79Rh62eUQVQ3gSGWwDDXvkKDLnAyOGYhwpSc1e05BrHTfEuigvJj8c5TUPwqxk5SQKrp
 /idl74HvQpZCB0whsc6thSG6yJJVYowhyPJBLVy3zn+p/4Gd93Qx/oe
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 5mq6KC60jO_zFIgLD2a_hwRmyghWCIkX
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b2572 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CToXZ0GCVVG03vgtT4YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9LkTl/zSHPu8
 NYQUXwGo3P/xDOdSltuBGBO0Q05xgW2rCKequ83mvdRJWGoFKbFNpZHdNo/1rRKIZouF9JxvAsA
 qQMPWwmrXjET1noLxyQzTHbG7nAFbHie6LxeC/GBDm3vQYaZEGGYd4Hx/n6tXfsP7VQem7tWlVk
 9cKSbUUFi/2b1XdlhLkCCpJYxe8/pVOnOzVWOTdrSi53NJ+O7iTRZr+1tTmX3nSnA5Dwsdffvs3
 lyD+C93wnpl1a+4k4Cog36xApY4McTwAVia05tN2xZsSbpFmFo3+v2flACT0L6IKaAvnhHbeeDs
 3TF7e0edVEG0yDfi0vTa1BokdTHw2OspK3OaqDD5Ey/J1/QzvR7Sc9DOnik9gLblrRY22EKzmwd
 sbh0sY0EJNJRYlA6b6hTs0gp+mfFIyP09Hhi/n/p92ATpkCIlFzoUc6+fnKSmImT46O1v7rDZTf
 CVdAvopEJs09H0p6EFA==
X-Proofpoint-GUID: 5mq6KC60jO_zFIgLD2a_hwRmyghWCIkX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXzHwjv4CIDi4Z
 vdO0n10G9hK3l5ke9dpWYHd3GRRfzJyDrpPGhXlxLcTIwPnJKlyRLD5rgXw2T4Ys0XWP6lxJd9p
 Bza8JJOvFpl7Drs7CpayVH1mm0OunkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

When a cache-parented or memory-controller-parented MSC is probed via
device tree, the parent node was assigned directly to a
__free(device_node) variable without incrementing its reference count.
Both the parent and the cache/memory variable are declared with
__free(device_node), which causes the compiler to automatically insert
an of_node_put() call for each variable when they go out of scope.
Since both variables point to the same node but the reference count was
only incremented once by of_get_parent(), the node ends up being
released twice, causing a refcount underflow.

Use of_node_get() to take an explicit reference so each __free variable
holds its own reference.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 975ddab771b4..559fa09128b4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -280,7 +280,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 		type = MPAM_CLASS_CACHE;
 
 	} else if (of_device_is_compatible(parent, "cache")) {
-		cache = parent;
+		cache = of_node_get(parent);
 		type = MPAM_CLASS_CACHE;
 	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
 		memory = of_parse_phandle(np, "arm,mpam-device", 0);
@@ -290,7 +290,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 		}
 		type = MPAM_CLASS_MEMORY;
 	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
-		memory = parent;
+		memory = of_node_get(parent);
 		type = MPAM_CLASS_MEMORY;
 	} else {
 		/*

-- 
2.34.1

