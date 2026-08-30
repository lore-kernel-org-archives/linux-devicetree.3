Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DE339705
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093118; cv=none; b=uTA0bpiHEoViFHDOjTYG1WNyxe8/lgpC2SDVQkFuvAR4Ke9WItGc6RWbwa4t3IonuBMppwcA1B3LtcoQ7+pxW/C3DpnEMH9r6Dh5CYSxoD2Tu3nuyVv+oASkAADb940b1XtwbLiZAWsPb/QWSQpU7eV8593EwCyR+ey6pAWK/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093118; c=relaxed/simple;
	bh=rXr6ALkiHMHf713Iew4k9Nwjfd2L6V40hSe8JbjfnkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZLKdYKPK9Rd/E45APf8wFGJXS9syU8lO4Lr8zh/N5h8ycYnrFejWlJr8lKTWKlRzP9GQQHqkjNhGsF43Lggs6AbOK6xpiF1ptYrCT3sVx7U0J4pRxJi75NAFTCYeLVVa99qkSnueT8MH4PrFxuQ89W4TqmESk8XcmSYSYEsj7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9HvTas0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC1osOw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9HvTas0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GC1osOw5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7IK6086426
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=87UiTHIpsbJI0MEwi3jZC7kB
	bzVbhdVpOgM75F6ZNAU=; b=Y9HvTas0eG2nUXeLARoIJXIZRH2ESGSZyfFXyDxA
	U9x9Rzrunb4t4jbR6OBKAMifmIUW8DnAtODR4+t7REj8d585QvhTKTEFrN0dRUb9
	6K4nPKNZAvi9JInF7/4Dsy0p1iRF02KYVotVW1AWVqi9AIXzp/OZlaLei9uaxV0P
	knjOmCQHllHvciBvP8GH3BARzr2HKothl5P5kRuJhiaRf/8Ec4CUpPxWL3BNlxqg
	/5ZAi+yUfjileGFMZBVJ+Z/V5vzmxQosN75Vw+owa1dR49L0z1n0wSCHkUx6xINe
	hs4yFnTQVVDIWcEeU/Bd7YBxjJ1AkmXKsz0FDBFs4WU+HA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2b06m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:31:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so52387851cf.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788093115; x=1788697915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=GC1osOw5TmSNyyv4QAwvI7ctbdZM0PM0U6HZ4w4r6xRkQgpEXDyPXb54+Ar5kFrv2n
         mVaS1CiaALHXknMT4bOPLx//xFHFvVHV3cfGziCoNCqWHt2t0s64E3LbfHG//taIToD5
         Wq2SkTpjASlLxHnz94jzSQ/NPVbyrSH+wSCZ2mMNb26V9iiRKS5Xq7K71KG7HzuOE721
         urq1Z5YT/VvnAwQDzt8uhyDdA1pjslCzM2pDFla4Ej7V82J53fvH9xuoSZrmnq7390UX
         gdRdLF0ZWkM6YFjJpb1euzsynNp+RpkkVuzGhgA5lwBa9P+jXvaUSM4Fm21y/VLD/wsw
         Aw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788093115; x=1788697915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=FYng1xILMQ0zjMe4GX66vHpG8oaYi3rIJcN+2fvWh0Yn8eC2Db7tx030dFdVCxohyd
         6YCwf/bmBSQFAtY/X0t7s1JouGm+iQ0Wgj3pkTf9rhXKDMVssnF5wN8s97VQ1ur+KmZb
         DSIwyO3zFH4ZRxG6/3I9VkT24xChDIMgW7GC0qzZlg2+S3YG5k2wvAY0zTkmIRT1uYWe
         ScFUX4f88Z/w95cOua3TBJ59+Ug5M1OhRGXL/M5ptfImPVDfTMXcML/XftHcNlScdg6L
         lowFKvVuRfZA/8xkvrf62lP7v1M4SsDcUJ8yftJkxGt2/3OnQ57XIjxTviuze2YBnT35
         zKrA==
X-Forwarded-Encrypted: i=1; AHgh+RrzLPaXplAAL76PXknJDbklJTX8EXHf+m5lKXGOzBVGi9AVisDe42U9f7b44Zo5FOIh580az1ze+Si8@vger.kernel.org
X-Gm-Message-State: AFuF++lZNas9tz7sautx9koHPfY0Ovd8NVvfc+U7DKuToRJRSNSBJC3u
	7UnTPLys1VJBoGuuI8wLgbNfjqoTEX2OLWxzwNz8374qW9tHVdbVilKpiTbTFGTB1pEzJDEVzMs
	3He4e7UNJ6VSC2xKFB+ALb5nmE3Eg+QN8kI7y/J0vOw5ORkvwe8Beq8EbRrB78gpb
X-Gm-Gg: AR+sD1299rJ4mt5jtdTGSodI2H5Z9iAt00on00bpiV8PAkh4AYtJEJU2yCsDiEYZESH
	Ix59w0BkQFXeAwd1UONWEOGLamzB1XYWXiyt0cTaU8qntswf112I9b8/RByutR4sgZTXZohA/kI
	ahBFyehUk3TAtpvf+O3aJhgdlqsvL4J3KNbU7NfYBEfDLnH6pBdb0POFKXwU0MqZOhrd9s1uGnr
	oAIploEbM6Ymbp3jHHQPaT0JBTlWtT0wiVu5Xcy+tSIrMvvf+Aq0SgzWfQk2Tf/Cmo/hx6ZCoHt
	AAQFe5XJHmQCvuVsUt4Jnmi1srLEHrNni5BUvUb6W/RwJcA65NNGFK9at1SnZw4vEYPBrLwdF6M
	F13eYkmIYhZftIg==
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22446471cf.2.1788093114921;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22445931cf.2.1788093114428;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm91156865e9.3.2026.08.30.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:31:53 -0700 (PDT)
Date: Sun, 30 Aug 2026 15:31:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI
 nodes
Message-ID: <3sjdjyd6xgy6il6dsmhd5uak4fms3sh6ltk4y6abvr6gh7gcsx@sqeodm4js5wq>
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a9422bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ptejb-WZcwQgoGJDpb0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YdUSKjZ6b2EDH84M8zG_NHGZh9mMp0Xf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX+Q/TYlAiiQmb
 Di44Y5u7TUnHSD9iYeLel7m+SkB5dPbzXriAp/1JDd2C3TtcFxcAh+ez0/NvEMLbpxI70/W+xO9
 2qEtiDAnvyfdtDhs/DBDmZy0df4gfVhJYxdMljR/Nnz5uvM9qet9ROyjYqkzF1Vi0bF+PFRfGWG
 7ByvFMFk76QHmfcUzr07wubOSxswRbt1G44SVczYG/5/7GEaLVuzmxJORCwzxt8QCALY3lOHVjA
 8liQHCfuf0dzYRZFUwC4YykKjyOJNriVEREefToQNozIcazn8CvkZ15vJ9KJ4p4eyk6Ble8yqKR
 vzqkoWgswyw/RxCdIo/b7yz7EwbXVFqVIPhTdjYRXjoxSLEiWkelMMW+N/FAXfBYy/EtnRO/p3j
 VY7oIIi9zJDRxIhA8vPLgimUoxaP5kbsMw3c63VwAPIXON+mnSXbfAamaelv5LiFinc5QpzI4qW
 JCf/sHhyNbYFtVg7OlQ==
X-Proofpoint-ORIG-GUID: YdUSKjZ6b2EDH84M8zG_NHGZh9mMp0Xf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX1HQ1X1jlW0CS
 +s3guvf5Wu+zEHdEwD6HbtHKgdFMVcxQu28sHecFaz3yUO0g+G6EgloITVgRyMl0FpxbxDiJT0+
 UZ+G//CmDCdSTwzahjgdAw6m8iWcS4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300106

On 26-08-30 20:26:33, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
