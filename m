Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5FC370ADA
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851809; cv=none; b=aGmANi9fQXE3hd1BiQlNjBc7kCWp1YNfeBeYsldQBD0hzaH+bJSCiqDdKtwCx0/TXJDrq2Nq45WweLwf+Sw/Lhy8HiY9IvojgHVnTMITWlMhkew8PJ1AUW43PTEsArb25xzBTXjQ2c54XtWlqi6LWYW1bF0bBLysdCn4gQurC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851809; c=relaxed/simple;
	bh=K+hdO8YwXvoHzemyeTOvyXNZZ9I8D6Bcyg+siZx5aqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzY1e+KndC8JiKtGZ1HW/EAlTolSnChwOigOQRY5zRP7WpYEq6c+B12GOY/hIWachNcAWeZpW9pCj60ghDRr5Shb60PxWdCB4K/QmD/6pnlmy50qL7cfhGOpJH43lz+f8JDG/T6NMYB0BfnU36PRNp+hDTJZH1+blWnyjlpGZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1+wkkgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHjzZ6we; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1+wkkgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHjzZ6we"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lopn2502343
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2Waas48tG26JkySLVN0ajTL
	Dsc6klnVI0Z2H492f5I=; b=e1+wkkgi3gpSEkCQ2/2tzYO3A4cRJ/mqHshaMCph
	R9LQlsu4y5f2aNbo+AsckJWWRT++vmg9PnM64cfq9Q5wroKDZPaN/wKBlXa2rT/6
	FhY72oBCHb67q7p/SexSuE1xFARj6VTO5EQY9eHhXHN2vbYc0Mlzq7EBMud5SyFA
	sHB8tNkiJMcE8ELkKElq2snXDFL5lMQkOuFeZuqg3M1XNWmyoYZVjXf17mepxHQ3
	RS46/NxRpdeiYaNeTv2CEFlmSF0GLxUwS4rwJ52hIH1mBvuZlcFob3AfmXdGVCaI
	YiNNuHYf/pxAgMyFflPn+wwAAWruSJZtPTpS8+87UoYmwg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g9cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:16:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so90947846d6.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851806; x=1789456606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=eHjzZ6we2/6gJhe2NEIMhmMSeFruTF+2PkUj7/JQJRJgMtQaQyiI4VxMK6QYdLmqS/
         2nJJQYW+FpXe1Y2nncBmUwxEcJlfQyUjJ5Eno03UFd+qGzDjpVRwVfleF4/iMYg/l/Y9
         0sv+MNbZvTKbKN+W7bBxczUKVMNuGKUPpa1mxj6QXZyCxkTurBiLRoi1G5DBPq1yauBM
         FxxVqc+GRvD0NFTQwvbxgrHtYmg8voWnwJTE3uOsLsyDJ5+wswhrpgdcOlgMtiLgtMjf
         WPszBqid+YCU1pSUcC4dfg6/Knf/9gS1FosG8LyAt49otHAXPy3s58GG8UDM7ZP1begk
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851806; x=1789456606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=eLWfwrxUnS4R36DCUk9b0NAG1ij2Hg6zfD87WhRITmQjeZXjssq8hP5/JH5+3pkXjG
         v2ZaJT4d0+AzRo7bhVVlJX0UYdIjCXwlXT2i/QQ+5hH3zOcaJyvVv5Dj1O2UUp7fCFxC
         m1IZWNhsRVwpqc3lAZXqcX9GscoUK0gHEwfoJxM+qgwOquqq7Al14C07XcAMM/BkzLpR
         Aa7T8fYdL6HKlO2HkiJRsgg7w0CM53nypOSFhPUKiiBxcDP3MElK9duwb85tOUVm6npO
         nusx4kvAdt8pfDQHcjrFRQTS8bGTsAtOAzw5gCi1pnr7sui10LwZYNZixrdjtT6VjyQ+
         6ypg==
X-Forwarded-Encrypted: i=1; AKwUvBxaMXNdP/HOXonc2rn2C0esgOtDAS3V1IGW+wgE9U999wtkxUNa0GTh3lnnAc5SG8FMtBt4352Xed15@vger.kernel.org
X-Gm-Message-State: AFuF++kGQrBU6xVRPHFMT3yQIsZU/tttfPkhAR2ijubMhJae8ot4lkAG
	kvIthwY89eK43YD1FTY13gxSrHfTCqUnHNcMDWbC23CboyHGRa/jyhup+fiip+TX1zAfjVqbCPv
	ilDNOORhoB/jv7orgswH4+IgLyNxnfCDbQ5Rt7TNOYdUsWGmBL8eGj+KDytZgIMeM
X-Gm-Gg: AYBFou35AXuDiaiTehff+uPPTWABsOf8a4DUuePN1Uc+55D7q4RUjT9eWbCOGFfmr2X
	Q+qt4qL2BA0JqnS47WaNOBSToCdTMnrma39OU9lkmu7SDddt+Qgpi13sJHvpWPJszWRcwnj7Nhr
	egx/AF0T/fALNPBJLfu/uQ0r1TxJfBpuMQcowbKc1PXqyxIxq4JFRXbqMX7q9rSJIqQOLsjE3cz
	w5gNzRArSYX79+FybuRmhbvMMNglOb2KGFP9ByQT3CXnikZrXHm4KvHyRBQ1ZiS5pITGT5meUIi
	tFDh4QqvVnlkxCEicZmToiC+Tni461267w3vVL5ChDNh2QFXzj16jtH99xgza6DBmQr/qifuk0x
	JfPvijqRwTFo=
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025285185a.14.1788851806185;
        Tue, 08 Sep 2026 00:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025278685a.14.1788851805448;
        Tue, 08 Sep 2026 00:16:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm268894755e9.8.2026.09.08.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:16:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:16:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <sfdujw5phslyh4mornf4gii3tmlri64vrzh3atf3gar724dnmb@b7gwv6npuor7>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb65e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX4FYh5IqFCm5h
 8jy1zxS1BfuuQTg4Z2HTCyR6HpGOhNivrl31gb6Q3pqXvRlunLaAOFlVwEGHcGnGvyMum5xrvdJ
 2Eq2PRAnzjcmkdsdpq/c6NfvZOSoSDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXwktdzi0PXm0f
 iexusijNWTpvozymnLpTmCnovT8FFVc5GywXOCt2YtNVDwW7vBlyrW3JgKuUi3WNUeNfnlKyPA9
 5Fv4Q5xD1QtAy6ByTsXO2i6i89irRScqSGaQ3YIB+CPv1Z5x9LRl8JUFmA3o2OYVFjaHNXEsG6e
 XJKouQx/153YzhfgzIg8DWH+/T0STtcaQjQClSUB6Kxr5kKmcZ4BsfkkmdpeikNhmUqgYDqzz4Y
 WrZ5Em2U7tWLmPZxV04JaZaNiwt/1rFfOh2VM8e4FGqnpI1zr3huqhNkmAssrFIiIqpoH3oUklr
 dI5EgcZSwq1hH5ZCIVSf0YRXajWaolx/9Z7uMn2KBl2gnTIvElPlqXDh3vMRB8drzhd742O9+ih
 gJybxwIFExpHQVo026sr5e/eg70eYxrKWw3iKaQel7dOTEYPHXgesgLcZE8yPpPXO/p3TsgDwCC
 3YkkTaBARoO7A2ScflA==
X-Proofpoint-ORIG-GUID: fX9udNLVUkIxn_LBRdNOPu3IGhQMReSb
X-Proofpoint-GUID: fX9udNLVUkIxn_LBRdNOPu3IGhQMReSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 17:58:10, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
