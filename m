Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666830;
	b=2mJtLdWgDhWGol4pOgmm37Uq7NHNAk+3uYCzoBUN2GCZ7EGIy8jmHiXlOxVu4DopGDQ9
	 AxdvW9T0j4sCQQStpmY9ZnUH89N0oxNdA/TLvqXDBsEhcID+94UfhYKyGA0h3ecDHTirC
	 QZKNrYcC+C+zZrmERYkUMDsm120qkXCyR7QDuZGagYEH+fVjhcLplmQEK3fm+gK2Qmtpp
	 3uWznvQTpw0feKJfjR/xStsKGRoWLPB7MrAVuhzHp2Kb98VH6WYSR+6egJmyNIDt9WLXx
	 RW8WVR3pEITE+03yMLIuBXBs6+WznUalVwbMpukYV6ZY4tzrlrCY0ar+8njt4KNT3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
	b=sn2HT6BEAtn/SLA3hhic0NBCqNk0n6wXmo/rnKHy8P9RZ7d89sAG4obHR71kymMfP7tt
	 qMRqE5s8BXTlIMq9Qva1AqVMaR1ZFjg8lqmCnfNRomvBRG7g3ZZQAbv9Qxz4xHuczvfQy
	 zbU5tULANCPXc+cnFcx3brjro9LIsXSrBpKRG98XN9JjvDewNc6gALBqFOQLPc4m6x2he
	 nhD37/KQQVMW/Xq56QtWFMEIyXWAKkd8gXbJyDzm+8buPLKN818dHbwOBNgQJTgc6jaWI
	 Ryi1tHj291wV922eCJC1GoALPe/kVuShkuAdjWi4Xg5p77niKsmcMxli/f4xh9CKlDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA8606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FAA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkYOE3630609
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XelhVseWOPwz4cK878gUhIeM
	0Pn5vcuJ7TytfawmQ+E=; b=ZLnCZ5gFbYxUpWpwvVj/NNjZnWvQTap1jU22OKf5
	dloRiopwOIZa0H0Ug9cSEg5/C9JyyQqZHkEGLQJxl2F1rsnnyaL1fDOpNYSVIb55
	dCZgmG9ncu9LkgWXp6RPCLBY4byu75CfotvNz/JBakfL6ktE5KaDchfl9KtUxcHP
	qxGPFckLqPYU0265+OWevF5DqPLRTJurlBFFoviRNpu/Wvf4wTGB8xaVFQsjLUMM
	JBweGVbuv+3Vm31cuB3WZ9Usdm+6iHbSgcLsaiXj2bCT26fo58pcFlN8pQAkr61t
	RyT8eah7xzE01GnmDcC8FL6ZtVG9VM8NEorXa/0TFj24HA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8xms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:33:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so226347785a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794666828; x=1795271628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=HoyzYkXCS47q4ZIjLf7aTpXt/HucpMPZKjiINEjczVIzbpBbqQHN8AWq11WzQZSoAY
         rmoh8YeW/X/D+k8uQ8RLpMOLYAX5AexC+5uK9AX1Yvo9vNNHD/ehUd5UvV5y2UDwOWNb
         zskJNX89hr9ahUuChY8Ku4R4ZZK7OAFVA3kYwDP+n7W++vtl32T0iKh/qjjK/QRAK9x5
         5tnOISCsD0PLKorpsiQxAjO89l6cIkn6lVU9xS6YnthT2LAeaakxHWwAc+6GwTGZn0H7
         mw36tFSRW/ugkZx9/XJ/4F8jORfYYhH/eCfYV/tt3LRKs/3iyXa2nPquHfQMOl+/J5YB
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666828; x=1795271628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=p9dCQib0+b8Iu5IyKkwRLvS73ReDbPywPwLwK2MqCmaY8JRja8YxquBxz3ZFX71uuj
         IuGDwBdXsVM1RU9lme9fWqL6jn/VTF9Ysj2VkKyXX/FOGz2OT7yhX1QBeYTAVmXX7e3B
         +z9ddtGYlC5W45rbMaFzUNV9pnw3J33sTrt8welHiCy9FtNeyUae6aXp0Gg4uVbZYLgF
         4RHnwz0gruLfWk9wIYsGiQmAwQQia06EaKGsT1jNUWI0uL51rLLskAHwt+zPdDhsQ4TO
         9hxHwuMx0Iwh+jvCLYiKjz4Xh3of/bkMOUHzv4ZhBFLO75tqO411VAzE7JHOXd3n/dkl
         fvDA==
X-Forwarded-Encrypted: i=1; AL+hErGGZkG81ue0fNSicen7I3iC32H2ijYFgke+66ssk/Th+PMHc9cWclpMhxXrWKkfimXDWxE5qQOzt38L@vger.kernel.org
X-Gm-Message-State: APuU4Z8q1+OqlACUSeJylmp2h/gCRbbW/3qjOMASFcAnx9Gdy/0AEWKh
	v6yLYN/PDy+7Tg+xaeYVf9pPUajxIiQF9lBilCPxW/3Ucs7g6UqAL6UkRg2gIUwxctO3VQ3fSDn
	9x7Ha0oObA7Jgr6f5nye4N3XfjeNAQVSpdaidy+YqHxsimrKttZav+1GisO4/ldsPqDTtIKU+
X-Gm-Gg: AYBFou3iEKUt1o40GR6r2bdP+Hrn2/s+VuUezTV9zg9E2c6hRzmY7mpkE+w9XNnlb1p
	mSSCvXcfwM+iglukh0DOzDgCnsaC/waNPFyPlZYJ4ox/Cq8k4nNK0ItGjpaIqcp1B8jdzfcIofI
	jCENzr8Ia8NLub+6zR7YT/O/V7m5LkdwlaypfQhS6fCHB98uWU1qOY68OKFaoLJBAER2XNkL8Bc
	AqZaOin0dFx4CI1hu3KxvP50SD3qljB2TYkcsXv/d+vYpBumXUIPqAPqgMT3P0Z04UKkJ1HgH/e
	23OdHLc2tNy55VFP8dBREQOhiu1ZGS41FjBNuAoUd8yXWClVMM14UQPIYnUI9a280shALU89InC
	k7DZfNUPviW5cePN+KYoT5hdxBM+ZlHyqK61n9ygExDWbxTb2WZpCe03TBFj/dBLI
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546880885a.39.1794666827569;
        Sat, 14 Nov 2026 06:33:47 -0800 (PST)
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546877185a.39.1794666826943;
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm18652558f8f.7.2026.11.14.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Date: Sat, 14 Nov 2026 16:33:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
Message-ID: <slowdj62cba3dk27sgb5l6pe7keldx3k4iqvx2wc534gj7kmy7@x4dxbjmdmznh>
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfXxXQROIOZSNmw
 fYjNpZZjjqQadd9nwIFP4+j7HE6KE/6hL7f52LWI8Vsa9AraOjU71hua6UehLcb1jvUIwN0b93N
 3HOLWoRoKvCxJxYrBuoKgN/rJiJuvYmWTZuxUntiB4GhDrXXt9fkLlDwPfHhsF9upsr/yxg6jyO
 FoLQw3FEJP5VaexM5FBgLtieA2wzZ0KHe3WWImRmKHZMiY5Ncks44yi5uCjxnBt9pzPRgH9rGzm
 liXICjYzszd+MPcTILBcVlnz5mTqEFDDloq7/iXNVxs/BrayVZmy6j9ejNhh43+7vwzmaW0bYF1
 DBNlYqBwamQMNCCnPODyXo067h5AEMopByVuGen9pkwajd+zI0B77uIOw+SQFETvYElDBBcei2k
 IioWmmrUDbuhmcGT65paG+SEIdQ8vvJKKTmAxkuuI3T5pLqKNj8Jr9+E2s/2nJphIp7avtmPtFi
 QdLif5kG1Otztk1pLag==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af8714c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DNA0yAJo64Eed5ujH7jYPVCPTLs_GkLj
X-Proofpoint-ORIG-GUID: DNA0yAJo64Eed5ujH7jYPVCPTLs_GkLj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfX5QugZZpKb73o
 dYu3hEccQR0J3jaJhXv9aZIHLV3zF9yHGfMLHBu5dfJyZ1YOACrgmvZTwQnZichSkUrHKo7XeIH
 s5F8gaWG4IzMsrMPl4rAhfrOQtRTcww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140057

On 26-11-11 11:47:56, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
