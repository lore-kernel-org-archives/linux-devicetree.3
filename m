Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E84A43F3
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145262; cv=none; b=c76rCwR8tNdv3tjCrgRuUSvuQqoqxt2j7+/7bUstYkLLZMfIv8ockPzE4oxiScZxL/Yu2sjhSM4rbjZzNyUCkATFoAmD7dpj/kH+VYmwHo6qIyKh2gdm8/bHVV6yKeBwStRn5cY2s0SmVPtshqUAvPuk5iRE7o8q+0fu1+/BkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145262; c=relaxed/simple;
	bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEXL0KpgoJ3fOpR24s45fdx3wyI6S7sUvHGxh3XFIFckYycOFlyMdr7RrHcQfjsrZ1l0/Yl9ZOip7pAytQNhabUPNjyffgVTtEc8i9lwDV/Us156wDqllVaHF7kCyVm7+AQp9DUJ9cN1spU+oDzDgWeJyyh3WHHWXKMJ05Ejehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gyn0CnJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIJ7Vmbm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gyn0CnJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIJ7Vmbm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BF8hDF170538
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=; b=Gyn0CnJTq1DkJPqn
	Y51z7WA82r1rUVVjSw+LbPwKv5TyYcKkz/ER8mU91MT7X4QxRMV+s7DCpuZk2b5m
	52QXOrlDZyhUTlPPjDcYryL3lD2lXgYqecTh9a2y3mHAJVNvS4SrAP44gYjnYfLA
	c8i26qWnODbnPajTBDqIWpuY9iWqF/BtbyOa390A4C9PZLSXxo5PatM20nEESppu
	dyk61MmDwWXHDOQ0rN3CkTsjunKzvx7+EOwpjhX8CH9M8NPstxOc0BSvqKrEuLWm
	QauT8eHDU1bbtXYDjt1E42OGUxlfryvWXEznHF4qqpcUsBxT+Cpxfgyf0V5m1Ezx
	vav+Ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e8d3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so2016613a91.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145259; x=1789750059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=AIJ7Vmbmn293j/JNG5BRwkuyufE+ZkADE7YwMvZ7Fu/hRwzZk4mmRNL91+ZZpF7clD
         asShF4+/ZGr5NXVR8Os5YxmfRvHJjp+FkRl2+172l18GJstCb2Id5Gd1Sn8LYFc9yyPP
         1vhKGjcCkcGY9ewRblrSnmX9htOm+FYLfX8bSqY3RM4jiarpAn7S0ts9DZNWttONJfDK
         TetMf2IU+cDOaqHpJNcQEggYAO4s3aKdyuBJyh7MYKqzLbt6ZQyzE5Jv48uB/FogvUCp
         fTjgEQnCbmEkgOHMH0QWhhlR4x4GNt9NTLcdYGhA2vJebHX+rN4jhmmMfRYlFtaXhGK1
         pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145259; x=1789750059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=UpwmicTzBgXl79xT8Dr0fnGy5FKXUGAAIwLtVWjmlPqPyeZKhDWUS5SfP95xAeJmio
         d05LuesWbHcmv4p/kjWOn+F947hkTYPMNI3n9OXpkZLlznYlKoL+T+7Bp0e+eGwMRjtn
         bRKk5G7/KJc4BcoVzg819ojaJ66WkuL88jQhOYed9aD0gUEn6V3h5l3tCCTMPifPDi8Q
         voFMc3gyPo+dQ0EEUlVp6SNKdqLT7C4rXv7lgLW/B9pY5xzliUO2Tflo7GhmFT4yWcHd
         aLtAJjdg7umzNpyC/MwmEIjyXq93QtwP6NHV0wIfmZCip/lLTIm33IPmR93+0p5Pt96b
         apBQ==
X-Forwarded-Encrypted: i=1; AKwUvByoPAh/j3Wu2vKbMa6TQY1P1nfBDtiP6NYf3YQiEP+u8xuqLPz298CLuylKKst22VIDOvz95cjy3YZF@vger.kernel.org
X-Gm-Message-State: AFuF++lWguvgPlX0r6MdzoStp3y1ICgiSZ/ZHFN2ila9i2zD5bjD8P47
	HVCCA4P+q4NXhWwF/YA1P+XILigoVovDWNxWtbTYopf4KzcNbiUXwRCMS2OQ9jhz5DkfAXHj/U3
	P7Gr/28wZ3xPum2lsCJR7YN0TxqW9SJznzK7eNFPcdQkoUglgrpLZKlf4XXnEO2se
X-Gm-Gg: AYBFou3k8D7oFiVFvE7804k8eS7W0uuecju8/flLuTV6i8RTtBtIyPra5Ajp1M5ulul
	cIQ/b2E11AGDsdQMiFsE32WF9zFSeK69eC4snqeXLdUx84ZKVIMzDbzBV3Xtj74CTfm+VKZnupE
	QECGKZZsX70GYL4TwOsGb2Nd9wQRakr8fsFvqsD6ZzJi+940qKSQia5fEDuMomkbn1VhpI5pd+Z
	fpgS7UsLZeM0FCh8xVvLeE5DSUqq0H5oFHqTn/vudjPO0DkCXpcc4E+Dbydn+bDP1Q1Ana2CTaB
	VtXRS7Pj+H2z+A9DsgyOuAamc5lVTbi8Dt3W2RErkcuZSQRk3vfWVz0iweHKk+v7XYx87fC1wHo
	SZ4d9MMps4TSIgmeFHz/4qzsEmw==
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967260a91.20.1789145257201;
        Fri, 11 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967200a91.20.1789145256741;
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:06 +0530
Subject: [PATCH 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-2-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=1348;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
 b=QnYHneeV9+kW1ROf5mDkfh/qHaTMW+7cpvw79FXnUfjg6WKLDqWbGEfXyTQNv5/QalqHBFloi
 lnGigFGogtsBtUzK4jB2uGc/GQkzYdQRUUoXpZmvhohD6OrAMiuqxv9
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX94X989WX6b0O
 PLa2LKm7ioDdsMuaSv3zmgNAq4jkeGnlCrqAzOYN6dbV25ObZ4G4F5IOdaceXbP2KgusdvUubZY
 4+s/NR/0RpD+YPizh5dnwZaCI+FDA0t6vHidauxPk6BKXa4bmnTOZNHB00a4UCiFTKJaZhVZMO3
 rrQOGtOVUjFpxBPCoUSzxOrKedvlhBhPl/N5W5oxR1sohA6scptUueSbLRPm5YkKmanTXy+rJdd
 i4UhuORfBdv85WCyhOA4Y0+ghDO8WeYROWyhWctFXURZMNOf7tALn27wyz6SiT2vbbS6IaeSSdb
 ZV5fBJ7EY3jjtKfvXV6YW15qQi3gYRO8AsgVf3MyJxRLd6+vp3DgSto2gV2tXD9FSaGI3/RTKtu
 YjoNCDrKpYePm1dZaEosnmcMHhloJ6N1ezck6OO+ovVqasqoSpZfH1vuY7J+/v7JU0/qotyS1JR
 xZwPMv5c1VZehTv35pA==
X-Proofpoint-ORIG-GUID: yRe09kfm7eeiikmQuhxHljX4GFlm9_Hl
X-Proofpoint-GUID: yRe09kfm7eeiikmQuhxHljX4GFlm9_Hl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX/UwC68YNNwRz
 GWMX/YO5mG22frQ+8o7YP7vK2vsw0DUicXPQ415ET1tGAU7/mStYM53CNZqYlHMY84IRfwPsiAe
 o/2J5X8JL6hqS+PfBiCvCAXK+6xIZ4A=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa430ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Fvqz0uoX0QqgC4h9zMkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110234

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

