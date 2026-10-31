Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456061;
	b=sPM96QKwxRr8049N6CP2fBvoqYnKNS6mNpg55+hHt9O7f4A3mGmVA+l82Zzoe7JTNjmR
	 nRstDhS8wkiLU7TcuECHiyla/wSnxVDlxW7xfKNx560tKMYqoOg250tAo5hgATuv1b1uf
	 DpFMU5R2mK89bvJYAz2jsfa5q3bysJI9mIGUDZriZbHEwacwewNfPbqAAJW3YYbiJ5vCl
	 NoG3cDiNttVAINp5crJqPp2/XNTsxJM7yJge6hcaSF6yxy00/lsd952QHSutw708ppDM3
	 FiNeFF/sALdpYBBLjO4BMTRnwCZZJOKM29ns1KM9eGWU/NvBx5+1rHJNpPr4aYqq3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
	b=Wzs52Yc7vSvaKrWdNSuOp1/+zz6VGvtfuv2EcmGtrOmo1r4MZwZfnQN//NoysTWSMxc5
	 I2aZyM1EJxS9TDChITgUjMFeioCW0Oq0JEewlhhPrP6AfT/Hj1ogt55xjhvKTGJm4jknQ
	 ajEY2VW/NLkWvfw1QLzD0gZs2V881WfR03JMPdbT1jbYOOq2BFxWrS62WSSk0aA+3Gmy5
	 K14mpOapsGPUOy26ui39lKpiSQvB9uh4xTrBCKu2vrB5PyyJmMdSoTH4Vjnm1lHFBBmH4
	 eoPwgQvUEONfft0JFcsrtnuk2dNuCEOzOZexP7xcN8sYqGkKJJt8JVKPuE2ajBoRWYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3E606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE3E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00Yo589484
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=; b=RkfXQhcV2Gc2FsIM
	BR+1NwXe/fEZC5914jTFgS9eht8hn9w1Do92CpuoWuxQuEzMsdsceHxcLIud85V7
	pSkUuhhhiHAzas02eJtr8LPgZTQnN5KZj7m3yUU0SRqyaeSLZ29WhnSZsS/eChOD
	7PyfnlYRQueaVJP+pm7HYbvMSavX9I7CcWM/U25oIpBZV+KeZ4/9uNh7Y38Vi5RQ
	IuhAUIECW/wsU5q3joWOigacgJvW0rqmvf4tGK7pZtfax1Hyo9lreBVk0VL3yvw+
	xyc0c3x/3QPaidHVxTd5cBS+GAQmsetE+pQWgaMy8/q6cgdmRDR4Bw/ahyCsw3qz
	152koA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk134r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:14:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso1922331c88.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456059; x=1794060859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=BP08eHjkuMYKzj/TyDsc0gSw2BtkOr5LAVeEWdKvAhD+6snFbOHEjqI9INA8JQuuEu
         twk2ZN7+vxRWMz1hkc3ht5T+831/owAjDXO70LbInOtdZAbpKOdd8Ep9Shwu4qyDmjOS
         GKfe1JBImAuNDc3FnzYikxApqYnvS21oPUlp3qLqUayLzXCBE4Ch+wE1FUzramzFcEQk
         qSTYKLwqbEGb85YSnPJalmEMUPkje4fLYsk/5oFh47ip6i2UKH6v3wr//BowS3CARAWa
         fU3wKRFCn7L8J7qCoAyTb4SntahVsZ2M/Sk+/JA+tE6I8CGeURkbWbrXnMAq7NcFAwa8
         huzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456059; x=1794060859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=1okq8kMMSs8vwH0v+F//s3YDOahusud9mDMOrDBFM8wUCJA29b6iAUy09N4yfquWTn
         8C1ME+mg5Miw/SZUd+9AunjVWYMZsm8bhxRgDXcUfqkbT/JtcjgcpBdmKTjRMQ1HQTBs
         o8+zhfpH32TjAq4Mj7OQnhs3aze2O+TXJ6MkWc5Od192L4hLMx1O1TK3ewJLMNZOM8sQ
         tFh0aYwd/fPUEgezg2r0h+hwPLR/6UmT2ig1cZD8Kl3yXg9cVyWRcQHWRDXLd5dC4oJ9
         UuB/soMlDvQsupDBP/KrnJheZMd+QjtQksgezfjfQBvI2wGGi95MIvqYGGiJvkgXXMXG
         bliQ==
X-Forwarded-Encrypted: i=1; AKwUvByxCsr1OnN6JG+qkJ1Zy2EJter7cC5NjS0c15Z/9chSsxfXrECh/jnilieQQX1ejecDXGYXRigDCUbZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKjIuvzqQxyPQZYvGO89XcmBXBo+wUcLgm62mva5M5zdZxWbDc9
	Je2h7j1ZKBhi169spQQLwEdqq+akjMMiP7YUh1GOTbUW9G487+xDLm+3ac5S0zdfCE2q5YOg5Kz
	2+DoslNyrfGAfMieWMIZZAh8/OJhWdECMVqMYvYIlQHEBf4VZHHYG3D5tYuQF0kLW
X-Gm-Gg: AYBFou1e2WfgihYP15NCjKMCOXCfs6XJr0N5E1d1vGN8K/dvl08DmWRRkwweh+FzovM
	VPhSbTJe6VflaExWlwUvi7l2fr6PAXSsR9ox1HBdMhw2DdhCOwCpzboW2tdwv7lnK3NyCkC17XL
	dOwv+EueU61qLEGDRfTD/0ctviqVOZrr7R9WUNLzsmMmMQXqaQRgxK2YgEjM7SOnnRwTBS+EHkh
	Y9H0RWI/6LgqdldrNSa6M7jvTRwNCJXFiqBQSL2dDJ+5lXPfSvN/+Rr7MA6i5NfKGeb2WHR8Shp
	xsGM8BSE5G2PmfYi4/tMsr0P21q4TX7Mo5EmZreVe/aPXzS9ul7e2Zr2YtMDiEdWByEn3jYFPm2
	ng/5CqUx/0syzEoiEXoIJz8I7XYNPkBz1DLU84VzHeApkls5EeMuW28cpQXu3s0iB6CUDZJXKU5
	4=
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118315c88.37.1793456058879;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118252c88.37.1793456058014;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm21015339c88.9.2026.10.31.07.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 07:14:17 -0700 (PDT)
Message-ID: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 19:44:08 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Language: en-US
In-Reply-To: <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ngc3L8d7KSobQT0wbRolkVCJqgyCCi2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX7njeNardNXdo
 yRTtMCpoax+hjI3Q39rQnv8QoimBOwz6fxZwL45Hoe8g88Kx4MzAf2iTEmlTK+MzjNzQUEOk8w1
 VwKX5RrFrTaL3wrt5e/fHv9pJPWCNgtrs5fe4//PdiprRx8F+tKF1YN4oge3r6BOBVGBXq1QJ6y
 ctEXNZeRKur04rXfbILdRJg4zizh7AHC234TX2eP7H+Er/1CG/9AoQBChBY2ztcK0UO92VYWin/
 ZWXP3sjt8EUO28tPmUgNiIlX2qEz3o4Az7RUke0xtZ8Lri1zcQYFYUdn6lh+XlhsLq/KEBKbU4U
 WF5WjBge0TYzOJ45htTDcL2MoSSr6BxVoxQLo279NdTXmXadSsLqImLvrw0Qjhzn8ZjF2h57fse
 XczZX4kvCNP/SgqHkj+howw2WjOZc76QlkSuj9TZi3kQjljgjOLJt6cybnHLzNqK5MY/euZg1bO
 bXvQJRWtrU4mu7Qrm1Q==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5f7bb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=tzcnicmHaCEtZrSMFQwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX37y1HDemGwIo
 hhcjyd6fk4jBvhVF0VwVARDVLUGubdZFGNIV0PHNzmm3Rb8epOcVsD0YINV9iEOBYfx8wLOop//
 dDodzVJMBNqjAiDH91PetLYfPKNoSvw=
X-Proofpoint-ORIG-GUID: Ngc3L8d7KSobQT0wbRolkVCJqgyCCi2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310056



On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> Please note that 'csiphy_res_phy' was introduced a few lines above
> by this change, it's only purpose is to provide the needed supported
> media formats, and this is unavoidable.
> 

Right, agreed. Glymur uses the non-legacy path, but that path still uses
camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
CSIPHY id and supported media formats. That is why Glymur currently has
a non-NULL csiphy_res even though the actual PHY programming is handled
by the standalone CSI2 PHY driver.

> This change follows the assumption that pixel formats from all
> non-legacy PHYs are SDM845 compatible, that's true for this platform,
> it is expected to be true for the most of approaching non-legacy
> platforms, and on demand it may be changed later on.
> 
> The current form likely is the most compact and the least invasive
> change, which gets to the point of supporting CAMSS on platforms
> with no CSIPHY resources given in the CAMSS driver.
> 
> For instance, note, the recently proposed Glymur CAMSS [1] references
> X1E CSIPHY resources, which is actually incorrect, since there is
> no "csiphyX" I/O resources anymore for Glymur. This change can be
> reused for Glymur as well, and its reference to X1E CSIPHYs can be
> dropped, but any better proposal or improvement are welcome.

The intention was not to describe CAMSS-owned CSIPHY I/O resources for
Glymur. This also follows the earlier suggestion to reuse/fall back
to the Hamoa/X1E CAMSS description where possible:

https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex/

Moving Glymur to .csiphy_res = NULL is possible, but with this fallback
the CSIPHY id comes from the CAMSS port number. Since Glymur uses
CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.

Bryan, Loic, do you think we need that change now, or should Glymur keep
the current approach for this DTS series?

-- 
Regards,
Nihal Kumar Gupta

